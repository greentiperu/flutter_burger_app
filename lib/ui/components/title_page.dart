import 'package:flutter/material.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
              height: 18.0,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 3,
                    color: AppColors.yellow,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
