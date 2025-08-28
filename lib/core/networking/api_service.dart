import 'package:dio/dio.dart';
import 'package:radio_app/core/networking/api_constants.dart' show ApiConstants;
import 'package:radio_app/feature/home/data/models/response_station_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.searchEndpoint)
  Future<List<ResponseStationModel>> getStationsByCountry(
      @Query(ApiConstants.countryQueryParam) String country,
      );
}
