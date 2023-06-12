import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/nasa_photos_response.dart';

part 'api_service.g.dart';

const apiKey = String.fromEnvironment('API_KEY');

@RestApi()
abstract class AppApiService {
  factory AppApiService(Dio dio, {String? baseUrl}) = _AppApiService;
}

@RestApi(baseUrl: 'https://api.nasa.gov/mars-photos/api/v1')
abstract class NasaPhotosService extends AppApiService {
  factory NasaPhotosService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.queryParameters['api_key'] = apiKey;
        return handler.next(options);
      },
    ));
    return _NasaPhotosService(dio, baseUrl: baseUrl);
  }

  @GET('/rovers/curiosity/photos?sol=1000')
  Future<NasaPhotosResponse> getCuriosityPhotos();
}
