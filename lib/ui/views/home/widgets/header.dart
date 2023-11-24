import 'package:flutter/material.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 10.0,
          bottom: 25.0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Gustavo',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Text('Tell us what would you like to eat today?',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white54)),
              ],
            ),
            const Spacer(),
            Container(
              height: 45.0,
              width: 45.0,
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: AppColors.blacklight,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/fast_food/bag.svg',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
