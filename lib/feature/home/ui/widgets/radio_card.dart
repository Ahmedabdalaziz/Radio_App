import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'background_image.dart';

class RadioCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback? onPlayPause;
  final bool isPlaying;

  const RadioCard({
    super.key,
    required this.name,
    required this.image,
    this.onPlayPause,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: backgroundImage(context, image),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  theme.colorScheme.surface.withOpacity(0.8),
                  theme.colorScheme.surface.withOpacity(0.9),
                ],
                stops: const [0.4, 0.7, 1.0],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.gabarito(
                    textStyle: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Live Broadcast",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: GestureDetector(
                    onTap: onPlayPause,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary.withOpacity(0.1),
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        isPlaying
                            ? Bootstrap.pause_circle_fill
                            : Bootstrap.play_circle_fill,
                        size: 70.sp,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
