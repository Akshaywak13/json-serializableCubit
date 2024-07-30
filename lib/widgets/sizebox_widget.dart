import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key, this.child, this.width =0, this.height=0});

  final Widget? child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height.h, 
      width:width.w,
      child: child,
    );
  }
}
