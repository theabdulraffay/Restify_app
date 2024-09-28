import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_movie_ui/model/main_page_data.dart';
import 'package:rest_api_movie_ui/model/movie.dart';
import 'package:rest_api_movie_ui/services/movie_service.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> _movie = [];
      _movie = await movieService.getPopularMovies(page: state.page);
    } catch (e) {}
  }
}
