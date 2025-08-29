import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_app/feature/home/logic/station_state.dart';
import '../data/repo/station_repo.dart';
import '../data/models/response_station_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StationCubit extends Cubit<StationState> {
  final StationRepository repository;
  final _player = AudioPlayer();

  StationCubit(this.repository) : super(const StationState()) {
    _player.playerStateStream.listen((playerState) {
      final playing = playerState.playing;
      final processingState = playerState.processingState;

      if (processingState == ProcessingState.completed) {
        emit(state.copyWith(isPlaying: false));
      } else {
        emit(state.copyWith(isPlaying: playing));
      }
    });
  }

  Future<void> fetchStations() async {
    emit(state.copyWith(loading: true, error: null));

    final prefs = await SharedPreferences.getInstance();
    final country = prefs.getString("country") ?? "Egypt";

    final result = await repository.getStationsByCountry(country);

    result.fold(
          (failure) {
        emit(
          state.copyWith(
            loading: false,
            error: failure.message,
            stations: [],
          ),
        );
      },
          (stations) {
        emit(
          state.copyWith(
            loading: false,
            stations: stations,
            currentCountry: country,
          ),
        );
      },
    );
  }

  Future<void> playStation(ResponseStationModel station) async {
    final url = station.urlResolved ?? station.url;
    if (url?.isNotEmpty != true) {
      emit(state.copyWith(error: "Station URL not available"));
      return;
    }

    try {
      await _player.setUrl(url!);
      await _player.setLoopMode(LoopMode.one);
      await _player.play();
      emit(
        state.copyWith(
          currentStation: station,
          isPlaying: true,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: "Failed to play station: $e"));
    }
  }

  Future<void> stopStation() async {
    await _player.stop();
    emit(state.copyWith(isPlaying: false));
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}
