
part of 'home_bloc.dart';

// Базовый класс для всех событий
sealed class HomeEvent {
  const HomeEvent();
}

// Событие загрузки форматов изображений
final class LoadImageFormatsEvent extends HomeEvent {
  const LoadImageFormatsEvent();
}
