
import 'package:bookia_app/features/cart/cubit/cubit/show_cart_state.dart';
import 'package:bookia_app/features/cart/data/model/show_cart_model.dart';
import 'package:bookia_app/features/cart/data/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CartCubit extends Cubit<CartState> {
  CartCubit() : super(ShowCartInitial());
  Future<void> showCart()async {
    emit(ShowCartLoading());
    final response = await CartRepo.showCart();
    if (response is ShowCartModel) {
      emit(ShowCartSuccess(cartItem: response.data.cartItems));

    }else {
      emit(ShowCartError());
    }
  }
  Future<void> removeCart(int cartid) async {
    emit(RemoveCartLoading());
    final response = await CartRepo.removeCart(cartid);
    if ( response is String) {
      emit(RemoveCartSuccess(removeMessage: response));

      
    }else {
      emit(RemoveCartError());
    }
  }
}
