

import 'package:bookia_app/features/book_details/data/models/show_book_model.dart';
import 'package:bookia_app/features/book_details/data/repo/book_details_repo.dart';
import 'package:bookia_app/features/book_mark/data/repo/wishlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());
  
 Future<void> bookDetails( int id) async{
    emit(BookDetailsLoading());
    final response = await BookDetailsRepo.showBookDetails(id);
    if (response is ShowBook) {
      emit(BookDetailsSuccess(bookModel: response.data));
    }else {
      emit(BookDetailsError());
    }
  }
  Future<void> addWishList( int productId) async{
    emit(AddWishlistLoading());
    final response = await WishlistRepo.addWishlist(productId);
    if (response is String) {
      emit(AddWishlistSuccess(successMessage: response));
    }
    else {
    emit(AddWishlistError());
    }
   }
}
