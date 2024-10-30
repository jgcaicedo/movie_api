// ui/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/movie_provider.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buscador de Películas')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(labelText: 'Nombre de la película'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final provider = Provider.of<MovieProvider>(context, listen: false);
                    provider.searchMovies(_searchController.text);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<MovieProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (provider.movies.isEmpty) {
                  return Center(child: Text('No hay resultados'));
                } else {
                  return ListView.builder(
                    itemCount: provider.movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: provider.movies[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
