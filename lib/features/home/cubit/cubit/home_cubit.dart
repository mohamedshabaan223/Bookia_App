
import 'dart:core';
import 'dart:ffi';

import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/data/models/sliders_model.dart';
import 'package:bookia_app/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(SlidersInitial());

  init() async{
    await Future.wait([
      slidersHome(),
      getBookItem(),
    ]);
  }
  Future<void> slidersHome() async{
    emit(SlidersHomeLoading());
    final response = await HomeRepo.homeSliders();
    if (response is SlidersModel) {
      emit(SlidersHomeSuccsess(sliders: response.data?.sliders?? []));
    }else {
      emit(SlidersHomeError());
    }
  }
   Future<void> getBookItem() async {
    emit(GeyBestSellerLoading());
    final response = await HomeRepo.bookItemModel();
    if(response is BooksModel){
      emit(GeyBestSellerSuccess(book: response.data?.products ?? []));
    }else {
      emit(GeyBestSellerError());
    }
   }

}
