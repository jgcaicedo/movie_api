// providers/movie_provider.dart
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider with ChangeNotifier {
  final ApiService _apiService;
  List<Movie> _movies = [];
  bool _isLoading = false;

  MovieProvider({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();

    _movies = await _apiService.searchMovies(query);

    _isLoading = false;
    notifyListeners();
  }
}
