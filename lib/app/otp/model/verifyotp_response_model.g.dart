// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifyotp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$VerifyOtpResponseModelToJson(
        VerifyOtpResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.toJson(),
      'message': instance.message,
      'token': instance.token,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userExists: json['userExists'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userExists': instance.userExists,
    };
