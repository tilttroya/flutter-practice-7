
part of 'home_bloc.dart';

// Базовый класс состояний
sealed class HomeState {
  const HomeState();
}

// Начальное состояние
final class HomeInitial extends HomeState {
  const HomeInitial();
}

// Состояние загрузки
final class HomeLoading extends HomeState {
  const HomeLoading();
}

// Данные успешно загружены
final class HomeLoaded extends HomeState {
  final List<ImageFormat> formats;

  const HomeLoaded(this.formats);
}

// Ошибка загрузки
final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}
