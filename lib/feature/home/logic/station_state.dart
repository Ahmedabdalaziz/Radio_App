import '../data/models/response_station_model.dart';

class StationState {
  final bool loading;
  final List<ResponseStationModel> stations;
  final String? error;

  const StationState({
    this.loading = false,
    this.stations = const [],
    this.error,
  });

  StationState copyWith({
    bool? loading,
    List<ResponseStationModel>? stations,
    String? error,
  }) {
    return StationState(
      loading: loading ?? this.loading,
      stations: stations ?? this.stations,
      error: error,
    );
  }
}
