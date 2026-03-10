part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class SlidersInitial extends HomeState {}
final class SlidersHomeLoading extends HomeState {}

final class SlidersHomeSuccsess extends HomeState {
  final List<SlidersImages> sliders ;
  SlidersHomeSuccsess({required this.sliders});

}

final class SlidersHomeError extends HomeState {}
final class GeyBestSellerLoading extends HomeState {}
final class GeyBestSellerSuccess extends HomeState {
  final List<Product> book ;

  GeyBestSellerSuccess({required this.book});
}
final class GeyBestSellerError extends HomeState {}

