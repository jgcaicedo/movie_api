// test/movie_provider_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_api/models/movie.dart';
import 'package:movie_api/providers/movie_provider.dart';
import 'package:movie_api/services/api_service.dart';
import 'package:movie_api/services/moke_api_service.dart';

@GenerateMocks([ApiService])

void main() {
  test('Prueba de búsqueda de películas', () async {
    final mockApiService = MockApiService();
    final provider = MovieProvider(apiService: mockApiService);

    // Configura el mock para devolver una lista de películas como Future.
    when(mockApiService.searchMovies('batman')).thenAnswer((_) async => [
      Movie(id: 1, title: 'Batman', posterPath: '', releaseDate: '', overview: '')
    ]);

    await provider.searchMovies('batman');

    expect(provider.movies.isNotEmpty, true);
    expect(provider.movies[0].title, 'Batman');
  });
}
