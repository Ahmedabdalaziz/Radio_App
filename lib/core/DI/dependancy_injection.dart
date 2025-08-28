import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';
import 'package:radio_app/core/networking/api_service.dart';
import 'package:radio_app/feature/home/data/repo/station_repo.dart';
import 'package:radio_app/feature/settings/logic/localization/localization_cubit.dart';
import 'package:radio_app/feature/settings/logic/theme/theme_cubit.dart';

import '../../feature/home/logic/station_cubit.dart';

final getIt = GetIt.instance;

Future<GetIt> setUpGetIt() async {
  getIt.registerLazySingleton<Dio>(() => Dio());

  ///////////////////////////// Register Services ////////////////////////////////
  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  ///////////////////////////// Station Repo //////////////////////////////////
  getIt.registerLazySingleton<StationRepository>(
    () => StationRepository(getIt<ApiService>()),
  );
  ////////////////////////////// Station Cubit //////////////////////////////////
  getIt.registerFactory<StationCubit>(
    () => StationCubit(getIt<StationRepository>()),
  );

  //////////////////////////////// theme Cubits //////////////////////////////////
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  /////////////////////// Localization Cubits ////////////////////////////////
  getIt.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());

  return getIt;
}

// api service done
// localization cubit done
// station at all done
// theme cubit done
