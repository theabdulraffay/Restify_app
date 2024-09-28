import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_movie_ui/model/movie.dart';
import 'package:rest_api_movie_ui/services/http_services.dart';

class MovieService {
  final GetIt getit = GetIt.instance;

  late HttpServices http;
  MovieService() {
    http = getit.get<HttpServices>();
  }

  Future<List<Movie>> getPopularMovies({int? page}) async {
    Response? response = await http.get('/movie/popular', query: {
      'page': page ?? 0,
    });
    if (response!.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies = data['results'].map<Movie>((movie) {
        return Movie.fromJson(movie);
      }).toList();
      return movies;
    } else {
      throw Exception('');
    }
  }
}
