part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class LocalizationLoading extends LocalizationState {}

final class LanguageChanged extends LocalizationState {
  final Locale languageCode;

  LanguageChanged({required this.languageCode});
}
final class LanguageError extends LocalizationState {
  final String message;

  LanguageError({required this.message});
}
