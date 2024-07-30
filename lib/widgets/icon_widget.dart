import 'package:erp_demo/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    super.key,
    required this.data,
    this.width = 12,
    this.height = 12,
    this.color,
    this.onClick,
  });
  final String? data;
  final double? width;
  final double? height;
  final Color? color;
  final Function? onClick;

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.onClick != null
        ? InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              widget.onClick!();
            },
            child: _iconWidget(),
          )
        : _iconWidget();
  }

  _iconWidget() {
    return Container(
      width: 24.w,
      height: 24.h,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        widget.data ?? "",
        width: widget.width,
        height: widget.height,
        color: widget.color ?? AppColors.whiteColor,
      ),
    );
  }
}
