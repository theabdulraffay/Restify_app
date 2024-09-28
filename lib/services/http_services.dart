import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_movie_ui/model/app_config.dart';

class HttpServices {
  final Dio dio = Dio();
  final GetIt getit = GetIt.instance;

  late String base_url;
  late String api_key;

  HttpServices() {
    AppConfig config = getit.get<AppConfig>();
    base_url = config.BASE_API_URL!;
    api_key = config.API_KEY!;
  }

  Future<Response?> get(String path, {Map<String, dynamic>? other, required Map<String, int> query}) async {
    try {
      String url = '$base_url$path';
      Map<String, dynamic> query = {'api_key': api_key, 'language': 'en-US'};
      if (other != null) {
        query.addAll(other);
      }

      return await dio.get(url, queryParameters: query);
    } on DioError catch (e) {
      print('object');
    }
  }
}
