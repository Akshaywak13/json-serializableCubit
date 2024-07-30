import 'package:json_annotation/json_annotation.dart';

part 'verifyotp_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VerifyOtpResponseModel {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'data')
  Data? data;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'token')
  String? token;

  VerifyOtpResponseModel({
    this.status,
    this.data,
    this.message,
    this.token,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'userExists')
  bool? userExists;

  Data({
    this.userExists,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
