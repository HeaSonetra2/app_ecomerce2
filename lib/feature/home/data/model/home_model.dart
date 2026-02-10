class HomeModel {
  final String success;
  final String message;
  final dynamic data;

  HomeModel({required this.success, required this.message, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
