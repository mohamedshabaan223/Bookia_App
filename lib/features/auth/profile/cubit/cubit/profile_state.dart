part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final UserData? userData ;

  ProfileSuccess({required this.userData}); 
}
final class ProfileError extends ProfileState {}
final class UpdateProfileLoading extends ProfileState {}
final class UpdateProfileSuccess extends ProfileState {
  final UserData? userData ;

  UpdateProfileSuccess({required this.userData}); 
}
final class UpdateProfileError extends ProfileState {}
