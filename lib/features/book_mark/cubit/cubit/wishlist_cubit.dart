


import 'package:bookia_app/features/book_mark/data/models/show_wishlist_model.dart';
import 'package:bookia_app/features/book_mark/data/repo/wishlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
Future<void> showWishlist()async{
  emit(ShowWishlistLoading());
  final response = await WishlistRepo.showWishlist();
  if (response is ShowWishlistModel) {
    emit(ShowWishlistSuccess(wishItem: response.data.items));
  }else {
    emit(ShowWishlistError());
  }
}
  
}
