import '../data/models/response_station_model.dart';

class StationState {
  final bool loading;
  final List<ResponseStationModel> stations;
  final String? error;
  final bool isPlaying;
  final ResponseStationModel? currentStation;
  final String? currentCountry;

  const StationState({
    this.loading = false,
    this.stations = const [],
    this.error,
    this.isPlaying = false,
    this.currentStation,
    this.currentCountry,
  });

  StationState copyWith({
    bool? loading,
    List<ResponseStationModel>? stations,
    String? error,
    bool? isPlaying,
    ResponseStationModel? currentStation,
    String? currentCountry,
  }) {
    return StationState(
      loading: loading ?? this.loading,
      stations: stations ?? this.stations,
      error: error,
      isPlaying: isPlaying ?? this.isPlaying,
      currentStation: currentStation ?? this.currentStation,
      currentCountry: currentCountry ?? this.currentCountry,
    );
  }
}
