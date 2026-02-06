class VerifyOtpModel {
  final bool success;
  final String message;
  final dynamic data;

  VerifyOtpModel({required this.success, required this.message, this.data});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
