import 'package:erp_demo/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget(
      {super.key,
      this.controller,
      this.digitLength,
      this.inputFormatters,
      this.keyboardType,
      this.userTextColor,
      this.userTextfont,
      this.height,
      this.width,
      this. validator,
      this.labelText,
      this.onChanged});
  final TextEditingController? controller;
  final int? digitLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Color? userTextColor;
  final double? userTextfont;
  final num? height;
  final num? width;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: widget.userTextColor ?? AppColors.whiteColor,
          fontSize: widget.userTextfont ?? 15.sp,
          fontFamily: "GoogleSans"),
      cursorColor: AppColors.whiteColor,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged ?? (value) {},
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:const TextStyle(color: AppColors.whiteColor),
        contentPadding: EdgeInsets.all(15.h),
        constraints: BoxConstraints(
            maxHeight: widget.height?.h ?? 44,
            minHeight: widget.width?.w ?? 44),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.whiteColor, width: 2.r)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.whiteColor, width: 2.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.whiteColor,
            width: 2.r,
          ),
        ),
      ),
    );
  }
}
