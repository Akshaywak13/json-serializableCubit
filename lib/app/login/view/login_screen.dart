import 'package:erp_demo/app/login/cubit/login_cubit.dart';
import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/utils/routes/routes.dart';
import 'package:erp_demo/widgets/button_widget.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_formfileld_widget.dart';
import 'package:erp_demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blueColor,
        appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: 'Login The Baap Company',
            fontSize: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBoxWidget(
                  height: 75.h,
                  child: TextformFieldWidget(
                    controller: _phoneController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Please enter a phone number';
                      } else if (value.length != 10) {
                        return 'Phone number must be 10 digits';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBoxWidget(
                  height: 20,
                ),
                ButtonWidget(
                    onClick: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context
                            .read<LoginCubit>()
                            .loginData(phoneNumber: _phoneController.text);
                        context.push(Routes.otpScreen,extra: _phoneController.text, );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: TextWidget(text: 'Sending Otp....'),
                          backgroundColor: AppColors.emeraldGreenColor,
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: TextWidget(
                              text: 'Please enter a valid phone number'),
                          backgroundColor: AppColors.crimsonRedColor,
                        ));
                      }
                    },
                    borderRadius: 10,
                    height: 40,
                    width: 150,
                    text: 'Send OTP')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
