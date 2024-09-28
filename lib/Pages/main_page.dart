import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_movie_ui/controllers/main_page_data_controller.dart';
import 'package:rest_api_movie_ui/model/main_page_data.dart';
import 'package:rest_api_movie_ui/model/movie.dart';
import 'package:rest_api_movie_ui/model/search_category.dart';
import 'package:rest_api_movie_ui/widgets/movie_tile.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, dynamic>((ref) {
  return MainPageDataController();
});

class MainPage extends ConsumerWidget {
  late double deviceHeight;
  late double deviceWidth;
  late TextEditingController controller;
  MainPageDataController? _mainPageDataController;
  MainPageData? _mainPageData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    controller = TextEditingController();

    // _mainPageDataController = ref.watch(mainPageDataControllerProvider
    //     as ProviderListenable<MainPageDataController?>);
    // _mainPageData = ref.watch(mainPageDataControllerProvider);
    // TODO: implement build
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundWidget(),
            forgroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget backgroundWidget() {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/original/58QT4cPJ2u2TqWZkterDq9q4yxQ.jpg')),
      ),
      child: BackdropFilter(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.2),
          ),
        ),
        filter: ImageFilter.blur(
          sigmaX: 13,
          sigmaY: 13,
        ),
      ),
    );
  }

  Widget forgroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, deviceHeight * .02, 0, 0),
      width: deviceWidth * .88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBarWidget(),
          Container(
            height: deviceHeight * .83,
            padding: EdgeInsets.symmetric(
              vertical: deviceHeight * .01,
            ),
            child: movieListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget topBarWidget() {
    return Container(
      height: deviceHeight * .08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          searchFieldWidget(),
          categorySelectionWIdget(),
        ],
      ),
    );
  }

  Widget searchFieldWidget() {
    return Container(
      width: deviceWidth * .50,
      height: deviceHeight * .05,
      child: TextField(
        controller: controller,
        onSubmitted: (input) {},
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white24,
          ),
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
          filled: false,
          fillColor: Colors.white24,
          hintText: 'Search....',
        ),
      ),
    );
  }

  Widget categorySelectionWIdget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (val) {},
      value: SearchCategory.popular,
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      items: [
        DropdownMenuItem(
          value: SearchCategory.popular,
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.upcomming,
          child: Text(
            SearchCategory.upcomming,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: SearchCategory.none,
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget movieListViewWidget() {
    final List<Movie>? movies = _mainPageData!.movies;
    // final List<Movie>? movies = [];
    // for (int i = 0; i < 20; i++) {
    //   movies!.add(
    //     Movie(
    //       name: 'Mortal Combat',
    //       languages: 'eu',
    //       isadult: false,
    //       decription:
    //           "Soulmates Eric and Shelly are brutally murdered when the demons of her dark past catch up with them. Given the chance to save his true love by sacrificing himself, Eric sets out to seek merciless revenge on their killers, traversing the worlds of the living and the dead to put the wrong things right.",
    //       posterPath: "/58QT4cPJ2u2TqWZkterDq9q4yxQ.jpg",
    //       backdropPath: "/Asg2UUwipAdE87MxtJy7SQo08XI.jpg",
    //       rating: 7.8,
    //       releaseDate: "2024-08-21",
    //     ),
    //   );
    // }

    // movies![0] = Movie(
    //   name: 'The Crow',
    //   languages: 'en',
    //   isadult: false,
    //   decription:
    //       "Soulmates Eric and Shelly are brutally murdered when the demons of her dark past catch up with them. Given the chance to save his true love by sacrificing himself, Eric sets out to seek merciless revenge on their killers, traversing the worlds of the living and the dead to put the wrong things right.",
    //   posterPath: "/58QT4cPJ2u2TqWZkterDq9q4yxQ.jpg",
    //   backdropPath: "/Asg2UUwipAdE87MxtJy7SQo08XI.jpg",
    //   rating: 7.8,
    //   releaseDate: "2024-08-21",
    // );

    // movies![1] = Movie(
    //   name: 'It Ends with Us',
    //   languages: 'en',
    //   isadult: false,
    //   decription:
    //       "When a woman's first love suddenly reenters her life, her relationship with a charming, but abusive neurosurgeon is upended, and she realizes she must learn to rely on her own strength to make an impossible choice for her future.",
    //   posterPath: "/AjV6jFJ2YFIluYo4GQf13AA1tqu.jpg",
    //   backdropPath: "/Asg2UUwipAdE87MxtJy7SQo08XI.jpg",
    //   rating: 6.7,
    //   releaseDate: "2024-08-07",
    // );

    // movies![2] = Movie(
    //   name: "Deadpool & Wolverine",
    //   languages: 'en',
    //   isadult: false,
    //   decription:
    //       "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
    //   posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    //   backdropPath: "/Asg2UUwipAdE87MxtJy7SQo08XI.jpg",
    //   rating: 7.6,
    //   releaseDate: "2024-07-24",
    // );

    // movies![3] = Movie(
    //   name: "Inside Out 2",
    //   languages: 'en',
    //   isadult: false,
    //   decription:
    //       "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
    //   posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
    //   backdropPath: "/Asg2UUwipAdE87MxtJy7SQo08XI.jpg",
    //   rating: 8.6,
    //   releaseDate: "2024-06-11",
    // );

    if (movies!.length != 0) {
      return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * .01, horizontal: 0),
                child: MovieTile(
                  movie: movies[index],
                  height: deviceHeight * .20,
                  width: deviceWidth * .85,
                ));
          });
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
