
import 'dart:math';

import 'package:bookia_app/features/place_order/cubit/cubit/governorate_state.dart';
import 'package:bookia_app/features/place_order/data/models/governorate_model.dart';
import 'package:bookia_app/features/place_order/data/repo/governorate_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class GovernorateCubit extends Cubit<GovernorateState> {
  GovernorateCubit() : super(GovernorateInitial());

  Future<void> showGovernorate() async{
    emit(GovernorateLoading());
    final reponse = await GovernorateRepo.governorate();
    if (reponse is GovernorateModel) {
      emit(GovernorateSuccess(governorate: reponse.data));
    }else{
      emit(GovernorateError());
    }
  }
   Future<void> placeOrder( int governorateId , String name , String email , String phone , String address) async{
    emit(PlaceOrderLoading());
    final reponse = await GovernorateRepo.placeOrder(
      governorateId,
      name,
      phone,
      email,
      address
    );
    if (reponse is String) {
     emit(PlaceOrderSuccess(message: reponse));
    }else{
      emit(PlaceOrderError());
    }
  }
}
