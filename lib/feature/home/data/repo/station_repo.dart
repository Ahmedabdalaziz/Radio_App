import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/dio_error_handler.dart';
import '../models/response_station_model.dart';

class StationRepository {
  final ApiService apiService;

  StationRepository(this.apiService);

  Future<Either<Failure, List<ResponseStationModel>>> getStationsByCountry(
      String country,
      ) async {
    try {
      final result = await apiService.getStationsByCountry(country);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure(dioErrorHandler(e)));
    } catch (e) {
      return Left(Failure("Unexpected error: $e"));
    }
  }
}
