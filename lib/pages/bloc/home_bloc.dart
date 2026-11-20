
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/image_format.dart';
import '../../mock/image_formats_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadImageFormatsEvent>(_onLoadImageFormats);
  }

  Future<void> _onLoadImageFormats(
      LoadImageFormatsEvent event,
      Emitter<HomeState> emit,
      ) async {
    // Показываем состояние загрузки
    emit(const HomeLoading());

    try {
      // Имитируем загрузку данных
      await Future.delayed(
        const Duration(milliseconds: 1500),
      );

      // Передаём загруженные форматы изображений
      emit(const HomeLoaded(imageFormats));
    } catch (e) {
      // Если произошла ошибка
      emit(const HomeError(
        'Не удалось загрузить форматы изображений',
      ));
    }
  }
}
