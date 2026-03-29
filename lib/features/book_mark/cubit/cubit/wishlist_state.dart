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
