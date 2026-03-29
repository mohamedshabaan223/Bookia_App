part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}
final class BookDetailsLoading extends BookDetailsState {}
final class BookDetailsSuccess extends BookDetailsState {
  final ShowBookModel? bookModel;

  BookDetailsSuccess({required this.bookModel});
}
final class BookDetailsError extends BookDetailsState {}
final class AddWishlistLoading extends BookDetailsState {}
final class AddWishlistSuccess extends BookDetailsState {
  final String? successMessage;

  AddWishlistSuccess({required this.successMessage});
}
final class AddWishlistError extends BookDetailsState {}
