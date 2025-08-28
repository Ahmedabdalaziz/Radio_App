import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radio_app/core/helper/extensions.dart';
import 'package:radio_app/feature/home/logic/station_cubit.dart';
import 'package:radio_app/feature/home/logic/station_state.dart';
import 'package:radio_app/feature/home/ui/widgets/empty_widget.dart';
import 'package:radio_app/feature/home/ui/widgets/error_retry_widget.dart';
import 'package:radio_app/feature/home/ui/widgets/loading_widget.dart';
import 'package:radio_app/feature/home/ui/widgets/stations_swiper_widget.dart';

import '../../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<StationCubit>().fetchStations());
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StationCubit>();
    final string = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(string.radioStations)),
      body: BlocConsumer<StationCubit, StationState>(
        listener: (context, state) {
          if (state.error != null) {
            context.showAppSnackBar(
              string.failedToLoadStation,
              backgroundColor: context.colorScheme.error,
              icon: FontAwesomeIcons.triangleExclamation,
              duration: const Duration(seconds: 2),
            );
          }
        },
        builder: (context, state) {
          if (state.loading) return const LoadingWidget();

          if (state.error != null) {
            return ErrorRetryWidget(
              message: state.error!,
              onRetry: () => cubit.fetchStations(),
            );
          }

          if (state.stations!.isEmpty) {
            return EmptyWidget(onRefresh: () => cubit.fetchStations());
          }
          return StationsSwiperWidget(stations: state.stations);
        },
      ),
    );
  }
}
