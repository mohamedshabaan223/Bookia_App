

import 'package:bookia_app/features/place_order/data/models/governorate_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class GovernorateState {}

final class GovernorateInitial extends GovernorateState {}
final class GovernorateLoading extends GovernorateState {}
final class GovernorateSuccess extends GovernorateState {
   final List<GovernorateItem>? governorate;

  GovernorateSuccess({required this.governorate});
}
final class GovernorateError extends GovernorateState {}

final class PlaceOrderLoading extends GovernorateState {}
final class PlaceOrderSuccess extends GovernorateState {
   final String? message;

  PlaceOrderSuccess({required this.message});
}
final class PlaceOrderError extends GovernorateState {}