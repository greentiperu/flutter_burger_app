import 'package:flutter/material.dart';
import 'package:flutter_app_burger/models/food.dart';
import 'package:flutter_app_burger/ui/views/details/widget/button_appbar.dart';
import 'package:flutter_app_burger/ui/views/details/widget/information.dart';
import 'widget/header.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.food,
  }) : super(key: key);
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.2],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.left, rect.height),
                );
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                'assets/fast_food/smoke.jpg',
                height: 530,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: -8,
              left: 20.0,
              right: 20.0,
              child: ButtonAppBar(),
            ),
            const Positioned.fill(
              child: Column(
                children: [
                  Header(food: null),
                ],
              ),
            ),
            Information(food: food),
          ],
        ),
      ),
    );
  }
}
