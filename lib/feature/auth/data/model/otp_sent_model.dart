class OtpSentModel {
  final bool success;
  final String message;
  final dynamic data;

  OtpSentModel({required this.success, required this.message, this.data});

  factory OtpSentModel.fromJson(Map<String, dynamic> json) {
    return OtpSentModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
