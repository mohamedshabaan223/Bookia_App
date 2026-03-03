
import 'package:bookia_app/features/home/data/models/sliders_model.dart';
import 'package:bookia_app/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  SlidersCubit() : super(SlidersInitial());


  slidersHome() async{
    emit(SlidersHomeLoading());
    final response = await HomeRepo.homeSliders();
    if (response is SlidersModel) {
      emit(SlidersHomeSuccsess(sliders: response.data?.sliders?? []));
    }else {
      emit(SlidersHomeError());
    }
  }
}
