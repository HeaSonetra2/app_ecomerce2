import 'package:ecomerce_app/feature/home/data/models/home_data_model.dart';

class HomeDataResponeModel {
  final bool success;
  final String message;
  final HomeDataModel data;

  HomeDataResponeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HomeDataResponeModel.fromJson(Map<String, dynamic> json) {
    return HomeDataResponeModel(
      success: json['success'],
      message: json['message'],
      data: HomeDataModel.fromJson(json['data']),
    );
  }
}
