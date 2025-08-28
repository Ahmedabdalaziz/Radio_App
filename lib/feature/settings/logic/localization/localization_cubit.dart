import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/helper/local_storage.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Future<void> changeLanguage(Locale languageCode) async {
    emit(LocalizationLoading());
    await Future.delayed(const Duration(seconds: 1));
    await LocalizationStorage.saveLanguageCode(languageCode.languageCode);
    emit(LanguageChanged(languageCode: languageCode));
  }

  Future<void> loadSavedLanguage() async {
    final savedCode = await LocalizationStorage.getLanguageCode();
    if (savedCode != null && savedCode.isNotEmpty) {
      emit(LanguageChanged(languageCode: Locale(savedCode)));
    } else {
      emit(LanguageChanged(languageCode: const Locale('en')));
    }
  }
}
