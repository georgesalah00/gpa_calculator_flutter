import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/screen_spacing.dart';
import 'package:gpa_calculator_flutter/core/routes/routes.dart';
import 'package:gpa_calculator_flutter/core/theming/styles.dart';
import '../../core/helpers/extenstions.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      appBar: _appBarContent(),
      body: _bodyContentDecoration(child: _bodyContent(context)),
    );
  }

  AppBar _appBarContent() => AppBar(
        centerTitle: true,
        title: const Text('GPA Calculator'),
        titleTextStyle: Styles.font30WhiteBold,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      );

  Container _bodyContentDecoration({required Widget child}) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade800,
              Colors.red.shade500,
              Colors.orange.shade900
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );

  Widget _bodyContent(BuildContext ctx) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/welcome_screen.png'),
          _dialogDecoration(child: _dialogContent(ctx))
        ],
      );

  Container _dialogDecoration({required Widget child}) => Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.r),
          topRight: Radius.circular(100.r),
        ),
      ),
      child: child);

  Widget _dialogContent(BuildContext ctx) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 40.h),
        child: Column(
          children: [
            Text(
              'Welcome to the GPA Calculator app',
              style: Styles.font20Black,
            ),
            ScreenSpacing.verticalSpacing(10),
            Text(
              'This app is special for Faculty of Engineering Alexandria University GPA system',
              style: Styles.font12grey,
            ),
            ScreenSpacing.verticalSpacing(20),
            SizedBox(
              width: 250.w,
              child: ElevatedButton(
                onPressed: () {
                  ctx.pushReplacementNamed(ctx, Routes.calculatingScreen);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  backgroundColor: Colors.orangeAccent.shade700,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: Text('Get Started', style: Styles.font20White),
              ),
            )
          ],
        ),
      );
}
