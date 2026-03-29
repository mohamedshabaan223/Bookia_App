class ShowWishlistModel {
  final WishlistData data;
  final String message;
  final List<dynamic> error;
  final int status;

  ShowWishlistModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ShowWishlistModel.fromJson(Map<String, dynamic> json) {
    return ShowWishlistModel(
      data: WishlistData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'] ?? 0,
    );
  }
}

class WishlistData {
  final int currentPage;
  final List<WishlistItem> items;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<LinkModel> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  WishlistData({
    required this.currentPage,
    required this.items,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory WishlistData.fromJson(Map<String, dynamic> json) {
    return WishlistData(
      currentPage: json['current_page'],
      items: (json['data'] as List)
          .map((e) => WishlistItem.fromJson(e))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List)
          .map((e) => LinkModel.fromJson(e))
          .toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: int.parse(json['per_page'].toString()),
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class WishlistItem {
  final int id;
  final String name;
  final String price;
  final String category;
  final String image;
  final int discount;
  final int stock;
  final String description;
  final int bestSeller;

  WishlistItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.discount,
    required this.stock,
    required this.description,
    required this.bestSeller,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      discount: json['discount'],
      stock: json['stock'],
      description: json['description'],
      bestSeller: json['best_seller'],
    );
  }
}

class LinkModel {
  final String? url;
  final String label;
  final bool active;

  LinkModel({
    required this.url,
    required this.label,
    required this.active,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}