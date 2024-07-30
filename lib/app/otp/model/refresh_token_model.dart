import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RefreshTokenModel {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  Data? data;
  @JsonKey(name: 'token')
  String? token;

  RefreshTokenModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'userExists')
  bool? userExists;
  @JsonKey(name: 'customerExists')
  bool? customerExists;
  @JsonKey(name: 'memberExists')
  bool? memberExists;

  Data({
    this.userExists,
    this.customerExists,
    this.memberExists,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
