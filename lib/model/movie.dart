import 'package:get_it/get_it.dart';
import 'package:rest_api_movie_ui/model/app_config.dart';

class Movie {
  late final String? name;
  late final String? languages;
  late final bool? isadult;
  late final String? decription;
  late final String? posterPath;
  late final String? backdropPath;
  late final double? rating;
  late final String? releaseDate;

  Movie(
      {this.name,
      this.languages,
      this.isadult,
      this.decription,
      this.posterPath,
      this.backdropPath,
      this.rating,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['title'],
      languages: json['origional_language'],
      isadult: json['adult'],
      decription: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      rating: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }

  String posterURL() {
    final appConfig = GetIt.instance.get<AppConfig>();
    return '${appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}
