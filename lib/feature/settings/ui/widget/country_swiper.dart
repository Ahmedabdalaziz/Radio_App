import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:radio_app/core/helper/extensions.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/local_storage.dart';
import '../../../../generated/l10n.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector({super.key});

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  int _currentIndex = 0;

  void _goToPrevious() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + countries.length) % countries.length;
    });
  }

  void _goToNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % countries.length;
    });
  }

  Future<void> _confirmSelection() async {
    final selectedCountry = countries[_currentIndex]["name"];
    await CountryStorage.saveCountryCode(selectedCountry!);
    context.showAppSnackBar(
      S.of(context).selectedCountry,
      backgroundColor: context.colorScheme.primary,
      icon: Bootstrap.check_circle_fill,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_left,
                  size: 28.sp,
                  color: theme.colorScheme.primary,
                ),
                onPressed: _goToPrevious,
              ),
              Expanded(
                child: SizedBox(
                  height: 90.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: countries.asMap().entries.map((entry) {
                      final index = entry.key;
                      final country = entry.value;
                      final bool isSelected = index == _currentIndex;

                      final offset = (index - _currentIndex).toDouble();

                      return AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        alignment: Alignment(offset * 0.6, 0),
                        child: AnimatedScale(
                          scale: isSelected ? 1.1 : 0.8,
                          duration: const Duration(milliseconds: 300),
                          child: Opacity(
                            opacity: isSelected ? 1.0 : 0.4,
                            child: Text(
                              country["flag"]!,
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontSize: isSelected ? 38.sp : 28.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                  size: 28.sp,
                  color: theme.colorScheme.primary,
                ),
                onPressed: _goToNext,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),

        GestureDetector(
          onTap: _confirmSelection,
          child: Container(
            width: 250.w,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: theme.colorScheme.primary, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  countries[_currentIndex]["flag"]!,
                  style: const TextStyle(fontSize: 24),
                ),
                SizedBox(width: 10.w),
                Text(
                  S.of(context).choose,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(Bootstrap.check_lg, color: context.colorScheme.secondary),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
