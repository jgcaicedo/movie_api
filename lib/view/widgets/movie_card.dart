// ui/widgets/movie_card.dart
import 'package:flutter/material.dart';
import '../../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.posterPath !="" ?Image.network(
   
     'https://image.tmdb.org/t/p/w200${movie.posterPath}' 
    , // Imagen de marcador de posición
)
: Icon(Icons.movie),
      title: Text(movie.title),
      subtitle: Text(movie.releaseDate),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
        );
      },
    );
  }
}
