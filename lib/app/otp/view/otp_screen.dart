import 'package:erp_demo/app/otp/cubit/cubit/otp_cubit.dart';
import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/utils/routes/routes.dart';
import 'package:erp_demo/widgets/button_widget.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_formfileld_widget.dart';
import 'package:erp_demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blueColor,
        appBar: AppBar(
          title: const TextWidget(
            text: 'Otp Screen',
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        body: BlocListener<OtpCubit, OtpState>(
          listener: (context, state) {
            if (state is OtpSuccess) {
              context.pushReplacement(Routes.homeScreen);
            } 
            else if (state is OtpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: TextWidget(
                      text: state.errorMessage ?? 'An error occurred.'),
                  backgroundColor: AppColors.crimsonRedColor,
                ),
              );
            } 
            else if (state is OtpVerifying) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: TextWidget(text: 'Verifying OTP...'),
                  backgroundColor: AppColors.emeraldGreenColor,
                ),
              );
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextformFieldWidget(
                    controller: _otpController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP';
                      } else if (value.length != 6) {
                        return 'OTP must be 6 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBoxWidget(height: 20),
                  BlocBuilder<OtpCubit, OtpState>(
                    builder: (context, state) {
                      if (state is OtpInprogress || state is OtpVerifying) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ButtonWidget(
                          onClick: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<OtpCubit>().otpVerify(
                                  otp: int.parse(_otpController.text),
                                  context: context,
                                  phoneNumber: widget.phoneNumber);
                            } 
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: TextWidget(
                                      text: 'Please enter a valid OTP'),
                                  backgroundColor: AppColors.crimsonRedColor,
                                ),
                              );
                            }
                          },
                          borderRadius: 10,
                          height: 40,
                          width: 150,
                          text: 'Verify OTP ->',
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
