import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_movie_ui/model/movie.dart';

class MovieTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie? movie;
  final GetIt getit = GetIt.instance;
  MovieTile({super.key, this.height = 0, this.movie, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          moviePoster(movie!.posterURL()),
          movieInfo(),
        ],
      ),
    );
  }

  Widget moviePoster(String url) {
    return Container(
      height: height,
      width: width * .35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
        ),
      ),
    );
  }

  Widget movieInfo() {
    return Container(
      height: height,
      width: width * .66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * .56,
                child: Text(
                  movie!.name!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                movie!.rating.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, height * .02, 0, 0),
            child: Text(
              '${movie!.languages!.toUpperCase()} | R: ${movie!.isadult} | ${movie!.releaseDate} ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, height * .03, 0, 0),
              child: Text(
                movie!.decription!,
                maxLines: 9,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white70, fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
