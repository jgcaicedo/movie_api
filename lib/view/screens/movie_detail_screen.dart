// ui/screens/movie_detail_screen.dart
import 'package:flutter/material.dart';
import '../../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 300,child:movie.posterPath !=""? Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'): Container()),
              SizedBox(height: 10),
              Text('Fecha de Estreno: ${movie.releaseDate}'),
              SizedBox(height: 10),
              Text(movie.overview),
            ],
          ),
        ),
      ),
    );
  }
}
