import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StationCircle extends StatelessWidget {
  final String stationName;

  const StationCircle({super.key, required this.stationName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: 40.r,
      backgroundColor: theme.colorScheme.primary.withOpacity(0.3),
      child: Text(
        stationName.isNotEmpty ? stationName[0] : "?",
        style: theme.textTheme.headlineSmall?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
