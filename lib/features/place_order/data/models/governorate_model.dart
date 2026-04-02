class GovernorateModel {
  final List<GovernorateItem> data;
  final String message;
  final int status;

  GovernorateModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      data: List<GovernorateItem>.from(
        json['data'].map((e) => GovernorateItem.fromJson(e)),
      ),
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class GovernorateItem {
  final int id;
  final String governorateNameEn;

  GovernorateItem({
    required this.id,
    required this.governorateNameEn,
  });

  factory GovernorateItem.fromJson(Map<String, dynamic> json) {
    return GovernorateItem(
      id: json['id'],
      governorateNameEn: json['governorate_name_en'],
    );
  }
}