import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/models/movie_model.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie(
      {super.key, required this.movie, required this.baseUrlImage});
  final Movie movie;
  final String baseUrlImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Movie"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 9 / 12,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage("$baseUrlImage${movie.posterPath}"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Judul Movie",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text("${movie.title}"),
                    SizedBox(height: 12),
                    Text(
                      "Rating Movie",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(height: 12),
                    Text(
                      "Tanggal Rilis",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${DateFormat("dd MMMM yyyy", "id_ID").format(movie.releaseDate)}",
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Bahasa",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text("${movie.originalLanguage}"),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Deskripsi",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text("${movie.overview}"),
        ],
      ),
    );
  }
}
