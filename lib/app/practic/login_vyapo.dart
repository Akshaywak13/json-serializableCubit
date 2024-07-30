import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenVyapo extends StatefulWidget {
  const LoginScreenVyapo({super.key});

  @override
  State<LoginScreenVyapo> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenVyapo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            child: Image.asset(
          "assets/images/Group 2.png",
        )),
        Positioned(
          top: 151,
          right: 0,
          child: Image.asset("assets/images/bubblle 03.png")),
          Positioned(
            
            child: Image.asset("assets/images/bubble 04.png")),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      // 'Login',
                      // style: TextStyle(
                      //   fontSize: 40,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      // textAlign: TextAlign.center,
                      text: 'Login',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    TextWidget(
                      text: 'Good to see you',
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(
                text: "Enter Email",
                color: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBoxWidget(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  filled: true,
                  fillColor: Colors.orange[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBoxWidget(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const TextWidget(
                  text: 'Next',
                  color: AppColors.blackColor,
                  fontSize: 20,
                ),
              ),
              const SizedBoxWidget(height: 16),
              TextButton(
                onPressed: () {},
                child: const TextWidget(
                  text: 'Cancel',
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
