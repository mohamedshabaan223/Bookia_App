part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}
final class ShowWishlistLoading extends WishlistState {}
final class ShowWishlistSuccess extends WishlistState {
  final List<WishlistItem> wishItem;

  ShowWishlistSuccess({required this.wishItem});
}
final class ShowWishlistError extends WishlistState {}
final class RemoveWishlistLoading extends WishlistState {}
final class RemoveWishlistSuccess extends WishlistState {
  final String? message;

  RemoveWishlistSuccess({required this.message});
}
final class RemoveEishlistError extends WishlistState {}
