import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/models/into_screen_model.dart';
import 'package:wordles_multi_game_flutter/widgets/cust_image.dart';

import '../bindings/route_names.dart';
import '../constants/constant_font.dart';
import '../utils/custom_enum.dart';
import '../widgets/common_button.dart';
import '../widgets/custom_text.dart';

class GameIntroScreen extends StatefulWidget {
  const GameIntroScreen({super.key});

  @override
  State<GameIntroScreen> createState() => _GameIntroScreenState();
}

class _GameIntroScreenState extends State<GameIntroScreen> {
  Games game = Games.theCrosswords;
  IntroScreenModel introScreenModel = introList.first;
  @override
  void initState() {
    game = Get.arguments;
    introScreenModel = introList.firstWhere((element) => element.game == game);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              introScreenModel.bgImage,
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustImage(
                      imgURL: introScreenModel.image,
                      height: 140.h,
                      width: 140.h,
                      boxfit: BoxFit.contain,
                    ),
                    Gap(20.h),
                    CustomText(
                      align: TextAlign.center,
                      txtTitle: introScreenModel.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                              fontFamily: ConstantFont.countachFont),
                    ),
                    CustomText(
                      align: TextAlign.center,
                      txtTitle: introScreenModel.subTitle,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                    ),
                    Gap(50.h),
                    Center(
                      child: CommonBorderButton(
                        title: "Play",
                        onTap: () {
                          switch (game) {
                            case Games.theCrosswords:
                              Get.offNamed(AppRouteNames.crossWordGameScreen);
                              break;
                            case Games.spellingBee:
                              break;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
