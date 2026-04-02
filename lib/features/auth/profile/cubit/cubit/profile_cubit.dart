
import 'package:bookia_app/features/auth/profile/data/models/profile_model.dart';
import 'package:bookia_app/features/auth/profile/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'profile_state.dart';




class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  init( String name , String phone , String address)async {
  await Future.wait([
    profile(),
    updateProfile(name, phone, address),
  ]
  );
}
  Future<void> profile() async{
    emit(ProfileLoading());
    final response = await ProfileRepo.showPrfile();
    if (response is ProfileModel) {
      emit(ProfileSuccess(userData: response.data));
    }else {
      emit(ProfileError());
    }
  }
   Future<void> updateProfile( String name , String phone , String address) async{
    emit(UpdateProfileLoading());
    final response = await ProfileRepo.updateProfile(name,
    phone,
    address);
    if (response is ProfileModel) {
      emit(UpdateProfileSuccess(userData: response.data));
    }else {
      emit(UpdateProfileError());
    }
  }
}
