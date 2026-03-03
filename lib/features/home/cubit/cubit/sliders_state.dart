part of 'sliders_cubit.dart';

@immutable
sealed class SlidersState {}

final class SlidersInitial extends SlidersState {}
final class SlidersHomeLoading extends SlidersState {}

final class SlidersHomeSuccsess extends SlidersState {
  final List<SlidersImages> sliders ;
  SlidersHomeSuccsess({required this.sliders});

}

final class SlidersHomeError extends SlidersState {}

