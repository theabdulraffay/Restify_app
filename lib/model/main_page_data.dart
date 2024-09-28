import 'package:rest_api_movie_ui/model/movie.dart';
import 'package:rest_api_movie_ui/model/search_category.dart';

class MainPageData {
  final List<Movie>? movies;
  final int? page;
  final String? seachCategory;
  final String? searchText;
  MainPageData({this.movies, this.page, this.seachCategory, this.searchText});

  MainPageData.initial()
      : movies = [],
        page = 1,
        seachCategory = SearchCategory.popular,
        searchText = '';

  MainPageData copyWith(
      List<Movie> movie, int page, String category, String searchText) {
    return MainPageData(
      movies: movie ?? this.movies,
      page: page ?? this.page,
      seachCategory: category ?? this.seachCategory,
      searchText: searchText ?? this.seachCategory,
    );
  }
}
