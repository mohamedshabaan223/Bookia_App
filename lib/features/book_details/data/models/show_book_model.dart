class ShowBook {
  final ShowBookModel data;
  final String message;
  final int status;

  ShowBook({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ShowBook.fromJson(Map<String, dynamic> json) {
    return ShowBook(
      data: ShowBookModel.fromJson(json['data']),
      message: json['message'] ?? '',

      status: json['status'] ?? 0,
    );
  }
}

class ShowBookModel {
  final int id;
  final String name;
  final String description;
  final int stock;
  final int bestSeller;
  final String price;
  final int discount;
  final double priceAfterDiscount;
  final String image;
  final String category;

  ShowBookModel({
    required this.id,
    required this.name,
    required this.description,
    required this.stock,
    required this.bestSeller,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.image,
    required this.category,
  });

  factory ShowBookModel.fromJson(Map<String, dynamic> json) {
    return ShowBookModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      stock: json['stock'] ?? 0,
      bestSeller: json['best_seller'] ?? 0,
      price: json['price'] ?? '0.0',
      discount: json['discount'] ?? 0,
      priceAfterDiscount: (json['price_after_discount'] != null)
          ? json['price_after_discount'].toDouble()
          : 0.0,
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }
}
