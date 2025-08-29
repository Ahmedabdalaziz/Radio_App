import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        ThemeMode,
        MaterialApp,
        Size,
        Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_app/feature/home/ui/main_screen.dart';

import 'core/theming/theme.dart';
import 'feature/settings/logic/theme/theme_cubit.dart';
import 'feature/settings/logic/localization/localization_cubit.dart';
import 'generated/l10n.dart';

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        BlocProvider(create: (_) => LocalizationCubit()..loadSavedLanguage()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          ThemeMode currentThemeMode;
          if (themeState is ThemeDark) {
            currentThemeMode = ThemeMode.dark;
          } else if (themeState is ThemeLight) {
            currentThemeMode = ThemeMode.light;
          } else {
            currentThemeMode = ThemeMode.system;
          }

          return BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, localeState) {
              Locale currentLocale = const Locale('en');
              if (localeState is LanguageChanged) {
                currentLocale = localeState.languageCode;
              }

              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp(
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: currentLocale,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: currentThemeMode,
                    debugShowCheckedModeBanner: false,
                    home: child,
                  );
                },
                child: MainScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
