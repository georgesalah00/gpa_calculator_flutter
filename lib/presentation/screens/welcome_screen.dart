import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/screen_spacing.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import '../../core/helpers/extensions.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      appBar: _appBarContent(),
      body: Decorations.bodyContentDecoration(
          _bodyContent(context), double.infinity),
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

  Widget _bodyContent(BuildContext ctx) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/welcome_screen.png'),
          Decorations.dialogDecoration(
              child: _dialogContent(ctx), height: 250, radius: 70)
        ],
      );

  Widget _dialogContent(BuildContext ctx) {
    const welcomeText = 'Welcome to the GPA Calculator app';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 40.h),
      child: Column(
        children: [
          Text(
            welcomeText,
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
              style: Decorations.orangeButtonStyle(),
              child: Text('Get Started', style: Styles.font20White),
            ),
          )
        ],
      ),
    );
  }
}
