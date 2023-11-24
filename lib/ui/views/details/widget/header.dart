import 'package:flutter/material.dart';
import 'package:flutter_app_burger/models/food.dart';
import 'package:flutter_app_burger/models/ingredient.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';
import 'package:flutter_app_burger/ui/views/details/widget/bread.dart';

import 'components.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.food,
  }) : super(key: key);
  final Food? food;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final components = <Ingredient>[];

  void process(Ingredient ingredient) {
    if (!_existElement(ingredient)) {
      components.add(ingredient);
      ingredient.state = 1;
    }
    setState(() {});
  }

  bool _existElement(Ingredient ingredient) {
    for (Ingredient item in components) {
      if (item.id == ingredient.id) {
        item.state = item.state == 0 ? 1 : 0;
        return true;
      }
    }
    return false;
  }

  @override
  void initState() {
    for (Ingredient item in responseIngredients) item.state = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 12,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const Bread(
                    path: 'assets/fast_food/top_bread.png',
                    height: 80.0,
                  ),
                  Components(components: components),
                  const Bread(
                    path: 'assets/fast_food/botton_bread.png',
                    height: 75,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: responseIngredients.length,
                  itemBuilder: (_, index) => TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 800),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0.0, 60 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () => process(responseIngredients[index]),
                      child: Container(
                        height: 82,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        decoration: BoxDecoration(
                          color: responseIngredients[index].state == 0
                              ? AppColors.blacklight
                              : AppColors.yellow,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Image.asset(
                                  responseIngredients[index].path,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              responseIngredients[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color:
                                          responseIngredients[index].state == 0
                                              ? Colors.white
                                              : Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
