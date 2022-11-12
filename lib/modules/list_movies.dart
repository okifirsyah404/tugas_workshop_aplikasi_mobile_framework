import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/core/models/movie_model.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/core/repository/movie_repository.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/modules/detail_movies.dart';

class ListMovie extends StatefulWidget {
  const ListMovie({super.key});

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  var movieList;
  var baseUrlImage = "https://image.tmdb.org/t/p/w500";

  @override
  void initState() {
    movieList = MovieRepository().getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieList,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Movie> dataMovie = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("Popular Movies"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: dataMovie.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 9 / 16),
                itemBuilder: (context, index) {
                  Movie movie = dataMovie[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMovie(
                            baseUrlImage: baseUrlImage,
                            movie: movie,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "$baseUrlImage${movie.posterPath}"),
                                fit: BoxFit.cover,
                              )),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "${movie.title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${DateFormat("dd MMMM yyyy", "id_ID").format(movie.releaseDate)}",
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[400],
                              ),
                              Text(
                                "${movie.voteAverage}",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
