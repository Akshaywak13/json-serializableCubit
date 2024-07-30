import 'package:bloc/bloc.dart';
import 'package:erp_demo/app/otp/model/verifyotp_response_model.dart';
import 'package:erp_demo/utils/api/api_base.dart';
import 'package:erp_demo/utils/preferences/local_preferences.dart';
import 'package:flutter/material.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  ApiBase _apiBase = ApiBase();

  Future<void> otpVerify({
    required BuildContext context,
    required String phoneNumber,
    required int otp,
  }) async {
    emit( OtpInprogress());
    await Future.delayed(Duration(seconds: 2));
    try {
      emit(OtpVerifying());
      await Future.delayed(Duration(seconds: 2));
      final parameters = {
        "phoneNumber": phoneNumber,
        "otp": otp,
      };
       _apiBase.post(
          'https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/auth/validateOtp/',
          parameters, (data) {
          var jsonData = VerifyOtpResponseModel.fromJson(data);
          String token = jsonData.token ?? "";
          LocalStorageUtils.saveUserDetails(token);
        emit(OtpSuccess());
      }, (error) {
        emit(OtpError(errorMessage: error));
      });
    } catch (e) {
      emit(OtpError(errorMessage: e.toString()));
    }
  }
}
