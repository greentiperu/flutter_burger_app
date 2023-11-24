import 'package:flutter/material.dart';
import 'package:flutter_app_burger/models/food.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';
import 'package:flutter_app_burger/ui/components/btn_primary.dart';
import 'package:flutter_svg/svg.dart';
import 'btn_event.dart';

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.38,
      minChildSize: 0.38,
      maxChildSize: 0.45,
      builder: (BuildContext context, ScrollController controller) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.blacklight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 60.0,
                height: 5.0,
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: <Widget>[
                    _title(context, food),
                    _text(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _additionalInformation(
                            context,
                            "assets/fast_food/timer.svg",
                            food.time,
                          ),
                          _bordeLeft(),
                          _additionalInformation(
                            context,
                            "assets/fast_food/fire.svg",
                            food.kall,
                          ),
                          _bordeLeft(),
                          _additionalInformation(
                            context,
                            "assets/fast_food/circle.svg",
                            food.serve,
                          ),
                          _bordeLeft(),
                          _additionalInformation(
                            context,
                            "assets/fast_food/promotions.svg",
                            "Promotion",
                          ),
                        ],
                      ),
                    ),
                    _quantity(context, food.price),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: BtnPrimary(
                        onPressed: null,
                        text: "Order Now",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _title(BuildContext context, Food food) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: Row(
      children: [
        Text(
          food.name,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/fast_food/star.svg',
          color: AppColors.yellow,
          width: 20.0,
          height: 20.0,
        ),
        const SizedBox(width: 10.0),
        Text(
          food.assessment,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    ),
  );
}

Widget _text(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Text(
      'Savor the perfect blend of juicy, grilled beef, melted cheese, and fresh toppings in our signature burger.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: 15,
          ),
    ),
  );
}

Widget _additionalInformation(BuildContext context, String path, String text) {
  return Column(
    children: [
      SvgPicture.asset(
        path,
        width: 25.0,
        color: AppColors.yellow,
      ),
      const SizedBox(height: 8.0),
      Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.white70,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
      ),
    ],
  );
}

Widget _quantity(BuildContext context, double price) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              const BtnEvent(
                color: AppColors.blacklight,
                icon: Icons.remove,
                onPressed: null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const BtnEvent(
                color: AppColors.blacklight,
                icon: Icons.add,
                onPressed: null,
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          "\$ ${price.toString()}",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
        ),
      ],
    ),
  );
}

Widget _bordeLeft() {
  return Container(
    height: 20.0,
    decoration: const BoxDecoration(
      border: Border(
        left: BorderSide(
          width: 2,
          color: Colors.white24,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}
