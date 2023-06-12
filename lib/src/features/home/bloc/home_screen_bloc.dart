import 'package:bloc/bloc.dart';

import '../../../domain/repositories/nasa_repository.dart';
import 'home_screen_events.dart';
import 'home_screen_state.dart';

final class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final NasaRepository _nasaRepository;

  HomeScreenBloc({required NasaRepository nasaRepository})
      : _nasaRepository = nasaRepository,
        super(HomeScreenInitialState()) {
    on<HomeScreenFetchPhotosEvent>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(
    HomeScreenFetchPhotosEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    emit(HomeScreenLoadingState());
    try {
      final photos = await _nasaRepository.getCuriosityPhotos();
      emit(HomeScreenLoadedState(photos: photos));
    } on Object catch (e) {
      emit(HomeScreenErrorState(e.toString()));
    }
  }
}
