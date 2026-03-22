part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<Product>? books ;
  SearchSuccess({required this.books});

}
final class SearcheErorr extends SearchState {
  final String errorMessage;
  SearcheErorr({required this.errorMessage});
}
