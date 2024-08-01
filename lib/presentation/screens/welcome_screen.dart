import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator_flutter/core/helpers/scale_size.dart';
import 'package:gpa_calculator_flutter/core/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/helpers/screen_spacing.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/decorations.dart';
import '../../core/theme/styles.dart';
import '../../core/helpers/extensions.dart';

class WelcomeScreen extends StatelessWidget {
  final SharedPreferences prefs;
  const WelcomeScreen({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeMode(context) == Brightness.light
          ? LightThemeColors.appBarColor
          : DarkThemeColors.appBarColor,
      appBar: _appBarContent(context),
      body: Decorations.bodyContentDecoration(
          context, _bodyContent(context), double.infinity),
    );
  }

  AppBar _appBarContent(BuildContext ctx) => AppBar(
        centerTitle: true,
        title: Text(
          'GPA Calculator',
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(ctx)),
        ),
        titleTextStyle: Styles.font30WhiteBold,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      );

  Widget _bodyContent(BuildContext ctx) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/welcome_screen.png'),
          Decorations.dialogDecoration(ctx,
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
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(ctx)),
            style: Styles.font20,
          ),
          ScreenSpacing.verticalSpacing(10),
          Text(
            'This app is special for Faculty of Engineering Alexandria University GPA system',
            style: Styles.font12grey,
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(ctx)),
          ),
          ScreenSpacing.verticalSpacing(20),
          SizedBox(
            width: 250.w,
            child: ElevatedButton(
              onPressed: () async {
                await prefs.setBool('openedBefore', true);
                // ignore: use_build_context_synchronously
                ctx.pushReplacementNamed(ctx, Routes.calculatingScreen);
              },
              style: Decorations.buttonStyle(ctx),
              child: Text(
                'Get Started',
                style: Styles.font20White,
                textScaler: TextScaler.linear(ScaleSize.textScaleFactor(ctx)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
