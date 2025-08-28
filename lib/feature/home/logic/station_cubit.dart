import 'package:bloc/bloc.dart';
import 'package:radio_app/feature/home/logic/station_state.dart';
import '../../../core/helper/local_storage.dart';
import '../data/repo/station_repo.dart';

class StationCubit extends Cubit<StationState> {
  final StationRepository repository;

  StationCubit(this.repository) : super(StationState());

  Future<void> fetchStations([String? country]) async {
    emit(state.copyWith(loading: true, error: null));

    String? selectedCountry = country ?? await CountryStorage.getCountryCode();

    selectedCountry ??= "Egypt";

    final result = await repository.getStationsByCountry(selectedCountry);

    result.fold(
      (failure) => emit(state.copyWith(loading: false, error: failure.message)),
      (stations) {
        CountryStorage.saveCountryCode(selectedCountry!);
        emit(state.copyWith(loading: false, stations: stations));
      },
    );
  }
}
