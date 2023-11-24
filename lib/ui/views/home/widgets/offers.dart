import 'package:flutter/material.dart';
import 'package:flutter_app_burger/models/food.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';
import 'package:flutter_app_burger/ui/views/details/detail_view.dart';
import 'package:flutter_svg/svg.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      sliver: SliverToBoxAdapter(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: responseFoods.length,
          itemBuilder: (_, index) => ItemOffer(food: responseFoods[index]),
        ),
      ),
    );
  }
}

class ItemOffer extends StatelessWidget {
  const ItemOffer({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailView(
            food: food,
          ),
        ),
      ),
      child: SizedBox(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140.0,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    color: AppColors.blacklight,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 56,
                        child: Transform.rotate(
                          angle: 4.68,
                          child: Text(
                            food.category,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            right: 15.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                food.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                              ),
                              Text(
                                food.information,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _icons(
                                    context,
                                    'assets/fast_food/money.svg',
                                    food.price.toString(),
                                  ),
                                  _icons(
                                    context,
                                    'assets/fast_food/timer.svg',
                                    food.time,
                                  ),
                                  _icons(
                                    context,
                                    'assets/fast_food/star.svg',
                                    food.assessment,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(food.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _icons(BuildContext context, String path, String information) {
  return Row(
    children: [
      SvgPicture.asset(
        path,
        color: AppColors.yellow,
        width: 18.0,
        height: 18.0,
      ),
      const SizedBox(width: 5.0),
      Text(
        information,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Colors.white, fontSize: 15),
      ),
    ],
  );
}
