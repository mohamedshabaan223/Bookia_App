


import 'package:bookia_app/features/cart/data/model/show_cart_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CartState {}

final class ShowCartInitial extends CartState {}
final class ShowCartLoading extends CartState {}
final class ShowCartSuccess extends CartState {
  final List<CartItemModel>? cartItem;

  ShowCartSuccess({required this.cartItem});
}
final class ShowCartError extends CartState {}
final class RemoveCartLoading extends CartState {}
final class RemoveCartSuccess extends CartState {
  final String? removeMessage;

 RemoveCartSuccess({required this.removeMessage});
}
final class RemoveCartError extends CartState {}

