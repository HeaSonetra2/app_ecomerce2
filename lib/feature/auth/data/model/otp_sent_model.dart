class OtpSentModel {
  final String success;
  final String message;
  final String data;

  OtpSentModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OtpSentModel.fromJson(Map<String, dynamic> json) {
    return OtpSentModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
