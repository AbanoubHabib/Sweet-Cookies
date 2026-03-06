import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/check_device_size.dart';
import '../../../../core/widgets/app_scaffold.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      appPushReplacement(context, HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColors;
    return AppScaffold(
      backgroundColor: colors.brownExtraLight,
      padding: EdgeInsets.zero,
      safeAreaTop: false,
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.images.splashHeader.image(),
            Assets.images.logo.image(
              width: checkVerySmallDeviceSize(context) ? 290 : 390,
            ),
            SizedBox(height: Dimens.largePadding),
            Assets.images.cake.image(
              width: checkVerySmallDeviceSize(context) ? 205 : 305,
            ),
          ],
        ),
      ),
    );
  }
}
