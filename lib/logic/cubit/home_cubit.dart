import 'package:bloc/bloc.dart';
import 'package:movie_tickets/models/movie.dart';
import 'package:movie_tickets/services/movies_api.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    // Mudando o estado
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch (e) {
      emit(HomeError("Não foi possível carregar a lista de filmes"));
    }
  }
}
