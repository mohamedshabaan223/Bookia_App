class ShowCartModel {
  final CartData data;
  final String message;
  final List<dynamic> error;
  final int status;

  ShowCartModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ShowCartModel.fromJson(Map<String, dynamic> json) {
    return ShowCartModel(
      data: CartData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'],
    );
  }
}

// ================= DATA =================

class CartData {
  final int id;
  final User user;
  final String total;
  final List<CartItemModel> cartItems;

  CartData({
    required this.id,
    required this.user,
    required this.total,
    required this.cartItems,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'],
      user: User.fromJson(json['user']),
      total: json['total'],
      cartItems: List<CartItemModel>.from(
        json['cart_items'].map((x) => CartItemModel.fromJson(x)),
      ),
    );
  }
}

// ================= USER =================

class User {
  final int userId;
  final String userName;

  User({
    required this.userId,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userName: json['user_name'],
    );
  }
}

// ================= CART ITEM =================

class CartItemModel {
  final int itemId;
  final int itemProductId;
  final String itemProductName;
  final String itemProductImage;
  final String itemProductPrice;
  final int itemProductDiscount;
  final double itemProductPriceAfterDiscount;
  final int itemProductStock;
  final int itemQuantity;
  final double itemTotal;

  CartItemModel({
    required this.itemId,
    required this.itemProductId,
    required this.itemProductName,
    required this.itemProductImage,
    required this.itemProductPrice,
    required this.itemProductDiscount,
    required this.itemProductPriceAfterDiscount,
    required this.itemProductStock,
    required this.itemQuantity,
    required this.itemTotal,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      itemProductId: json['item_product_id'],
      itemProductName: json['item_product_name'],
      itemProductImage: json['item_product_image'],
      itemProductPrice: json['item_product_price'],
      itemProductDiscount: json['item_product_discount'],
      itemProductPriceAfterDiscount:
          (json['item_product_price_after_discount'] as num).toDouble(),
      itemProductStock: json['item_product_stock'],
      itemQuantity: json['item_quantity'],
      itemTotal: (json['item_total'] as num).toDouble(),
    );
  }
}