import 'package:flutter/material.dart';

import '../card/game_category_card.dart';
import '../constants/constant_image.dart';
import '../utils/custom_enum.dart';
import '../widgets/common_button.dart';
import '../widgets/common_widget.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        context: context,
        title: "wordle",
        actions: [
          CommonIconButton(
            image: ConstantImage.setting,
            onTap: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.04,
                  child: CustomText(
                    align: TextAlign.center,
                    txtTitle: "WORDLE",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 80,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ),
              GridView.count(
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                children: Games.values
                    .map(
                      (game) => GameCategoryCard(game: game),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
