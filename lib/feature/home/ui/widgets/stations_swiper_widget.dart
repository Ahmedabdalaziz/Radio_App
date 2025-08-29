import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/feature/home/data/models/response_station_model.dart';
import '../../logic/station_cubit.dart';
import '../../logic/station_state.dart';
import 'radio_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class StationsSwiperWidget extends StatelessWidget {
  final List<ResponseStationModel> stations;

  const StationsSwiperWidget({super.key, required this.stations});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (stations.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Bootstrap.broadcast,
              size: 80.sp,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No stations available',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<StationCubit, StationState>(
      builder: (context, state) {
        return Swiper(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            final station = stations[index];

            final isPlaying =
                state.isPlaying &&
                state.currentStation?.urlResolved ==
                    (station.urlResolved ?? station.url);

            return RadioCard(
              name: station.name?.isNotEmpty == true
                  ? station.name!
                  : "Unknown Station",
              image: station.favicon?.isNotEmpty == true
                  ? station.favicon!
                  : "",
              isPlaying: isPlaying,
              onPlayPause: () =>
                  handlePlayPause(context, station, isPlaying),
            );
          },
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: false,
          control: SwiperControl(
            iconNext: Icons.arrow_forward_ios_rounded,
            iconPrevious: Icons.arrow_back_ios_rounded,
            color: theme.colorScheme.primary,
            size: 24.sp,
          ),
        );
      },
    );
  }

  void handlePlayPause(
    BuildContext context,
    ResponseStationModel station,
    bool isPlaying,
  ) {
    final cubit = context.read<StationCubit>();
    final url = station.urlResolved ?? station.url;

    if (url?.isNotEmpty == true) {
      if (isPlaying) {
        cubit.stopStation();
      } else {
        cubit.playStation(station);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Bootstrap.play, color: Colors.white, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'Now playing ${station.name ?? "Unknown Station"}',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Bootstrap.exclamation_triangle,
                color: Colors.white,
                size: 20.sp,
              ),
              SizedBox(width: 12.w),
              const Expanded(child: Text('Station URL not available')),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }
}
