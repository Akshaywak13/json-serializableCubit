import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarV2 extends StatefulWidget {
  const BottomNavBarV2({super.key});

  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.2,
                    child: FloatingActionButton(
                        backgroundColor: const Color(0xffE4FAFF),
                        child: const Icon(Icons.add),
                        elevation: 0.5,
                        onPressed: () {
                          context.push(Routes.newPostScreen);
                        }),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home_outlined,
                            size: 35.0,
                            color: currentIndex == 0
                                ? AppColors.whiteColor
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 35.0,
                              color: currentIndex == 1
                                  ? const Color(0xffE4FAFF)
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>AllRequests()));
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.water_drop_sharp,
                              size: 35.0,
                              color: currentIndex == 2
                                  ? const Color(0xffE4FAFF)
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                              context.push(Routes.customPaint);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.settings,
                              size: 35.0,
                              color: currentIndex == 3
                                  ? const Color(0xffE4FAFF)
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = AppColors.proposedholidayColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, -15); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(40.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, -55);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
