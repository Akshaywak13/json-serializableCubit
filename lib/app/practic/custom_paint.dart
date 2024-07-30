import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomPaintScreen(),
    );
  }
}

class CustomPaintScreen extends StatefulWidget {
  const CustomPaintScreen({super.key});

  @override
  State<CustomPaintScreen> createState() => _CustomPaintScreenState();
}

class _CustomPaintScreenState extends State<CustomPaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: CircularPainter2(),
            child: SizedBoxWidget(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          CustomPaint(
            painter: CircularPainter1(),
            child: SizedBoxWidget(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          CustomPaint(
            painter: BottomRightCircularPainter(),
            child: SizedBoxWidget(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          CustomPaint(
            painter: CenterShapePainter(),
            child: SizedBoxWidget(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
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
                      const TextWidget(
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
        ],
      ),
    );
  }
}

class CircularPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.liteOrange;

    // Top left shape
    Path path1 = Path();
    path1.moveTo(0, size.height.h * 0.3);
    path1.quadraticBezierTo(
        size.width.w * 0.50, size.height.h * 0.3, size.width.w * 0.3, 0);

    path1.lineTo(0, 0);
    path1.close();
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BottomRightCircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color =
          AppColors.litefadeOrange; // Assuming AppColors.liteOrange is defined

    // Calculate the radius based on canvas size
    double radius = size.width.w * 0.6; // Adjust the multiplier to change the size of the circle

    // Calculate the center position for the circle
    Offset center = Offset(size.width.w , size.height.h ); // Bottom right corner

    // Draw the circle
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Assuming the shape does not need to be repainted
  }
}

class CircularPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.liteDarkOrange
      ..style = PaintingStyle.fill;

    double radius = 130.0;
    Offset center = const Offset(-30, 80);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CenterShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.liteDarkOrange;

    // Define the path for the right-aligned, slightly upper center shape
    Path path = Path();
    double centerX = size.width.w * 0.85; // Adjusted to move it more to the right
    double centerY = size.height.h * 0.25; // Adjusted to move it higher
    double shapeWidth = size.width.w * 0.2;
    double shapeHeight = size.height.h * 0.1;

    // Top-left corner
    path.moveTo(centerX - shapeWidth.w / 2, centerY - shapeHeight.h / 2);
    // Top curve
    path.quadraticBezierTo(
        centerX,
        centerY - shapeHeight.h, // Control point
        centerX + shapeWidth.w / 2,
        centerY - shapeHeight.h / 2 // End point
        );
    // Right curve
    path.quadraticBezierTo(
        centerX + shapeWidth.w,
        centerY, // Control point
        centerX + shapeWidth.w / 2,
        centerY + shapeHeight.h / 2 // End point
        );
    // Bottom curve
    path.quadraticBezierTo(
        centerX,
        centerY + shapeHeight.h, // Control point
        centerX - shapeWidth.w / 2,
        centerY + shapeHeight.h / 2 // End point
        );
    // Left curve
    path.quadraticBezierTo(
        centerX - shapeWidth.w,
        centerY, // Control point
        centerX - shapeWidth.w / 2,
        centerY - shapeHeight.h / 2 // End point
        );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
