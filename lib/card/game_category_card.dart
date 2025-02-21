import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordles_multi_game_flutter/bindings/route_names.dart';

import '../constants/constant_font.dart';
import '../constants/constant_image.dart';
import '../constants/constant_string.dart';
import '../utils/custom_enum.dart';
import '../widgets/common_button.dart';
import '../widgets/custom_text.dart';

class GameCategoryCard extends StatelessWidget {
  const GameCategoryCard({super.key, required this.game});

  final Games game;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ConstantImage.getGamesImage(game),
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            align: TextAlign.center,
            txtTitle: ConstantString.getGamesTitle(game),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: ConstantFont.countachFont,
                ),
          ),
          CommonButton(
            onTap: () {
              Get.toNamed(
                AppRouteNames.gameIntroScreen,
                arguments: game,
              );
            },
            title: "Play",
          ),
        ],
      ),
    );
  }
}
