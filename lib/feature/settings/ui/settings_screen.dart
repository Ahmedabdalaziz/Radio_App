import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:radio_app/core/helper/spacing.dart';
import 'package:radio_app/feature/settings/ui/widget/country_swiper.dart';
import 'package:radio_app/core/helper/extensions.dart';
import '../../../core/helper/functions.dart';
import '../../../generated/l10n.dart';
import '../logic/theme/theme_cubit.dart';
import '../logic/localization/localization_cubit.dart';

enum AppLanguage { en, ar }

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return BlocConsumer<LocalizationCubit, LocalizationState>(
      listener: (context, state) {
        if (state is LanguageError) {
          context.showAppSnackBar(
            s.exitMessage,
            backgroundColor: context.colorScheme.error,
            icon: FontAwesomeIcons.triangleExclamation,
            duration: const Duration(seconds: 2),
          );
        }
      },
      builder: (context, state) {
        final localizationCubit = context.read<LocalizationCubit>();
        final themeCubit = context.read<ThemeCubit>();
        bool isDarkMode = context.watch<ThemeCubit>().state is ThemeDark;
        AppLanguage selectedLang = AppLanguage.en;
        if (state is LanguageChanged) {
          selectedLang = state.languageCode.languageCode == 'ar'
              ? AppLanguage.ar
              : AppLanguage.en;
        }
        final isLoading = state is LocalizationLoading;
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(title: Text(s.settings)),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(16.sp),
                      children: [
                        SwitchListTile(
                          value: isDarkMode,
                          title: Text(s.dark_mode),
                          secondary: const Icon(Bootstrap.moon_fill),
                          onChanged: (_) => themeCubit.toggleTheme(),
                        ),
                        const Divider(),

                        ListTile(
                          leading: const Icon(Bootstrap.translate),
                          title: Text(s.language),
                          trailing: DropdownButton<AppLanguage>(
                            value: selectedLang,
                            items: AppLanguage.values.map((lang) {
                              final flag = lang == AppLanguage.en
                                  ? "🇬🇧"
                                  : "🇸🇦";
                              final label = lang == AppLanguage.en
                                  ? s.english
                                  : s.arabic;
                              return DropdownMenuItem(
                                value: lang,
                                child: Text("$flag $label"),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                localizationCubit.changeLanguage(
                                  value == AppLanguage.en
                                      ? const Locale('en')
                                      : const Locale('ar'),
                                );
                              }
                            },
                          ),
                        ),
                        const Divider(),
                        CountrySelector(),
                        const Divider(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            s.followUs,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: context.colorScheme.secondary,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        verticalSpace(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Bootstrap.whatsapp),
                              iconSize: 28.sp,
                              onPressed: () => openLink(s.whatsapp, context),
                            ),
                            horizontalSpace(18),
                            IconButton(
                              icon: Icon(Bootstrap.facebook),
                              iconSize: 28.sp,
                              onPressed: () => openLink(s.facebook, context),
                            ),
                            horizontalSpace(18),
                            IconButton(
                              icon: Icon(Bootstrap.github),
                              iconSize: 28.sp,
                              onPressed: () => openLink(s.github, context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (isLoading)
              AnimatedOpacity(
                opacity: isLoading ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  color: theme.colorScheme.background.withOpacity(0.8),
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
