import 'package:tugas_workshop_aplikasi_mobile_framework/core/services/network_services.dart';

import '../models/movie_model.dart';

class MovieRepository extends NetworkServices {
  MovieRepository();
  MovieRepository._privateConstructor();
  static final MovieRepository _instance =
      MovieRepository._privateConstructor();

  static MovieRepository get instance => _instance;
  Future<List<Movie>> getMovie() async {
    var map = await getMethod();
    return PopularMovies.fromJson(map).results;
  }
}
