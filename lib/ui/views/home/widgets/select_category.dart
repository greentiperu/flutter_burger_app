import 'package:flutter/material.dart';
import 'package:flutter_app_burger/models/category.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 10.0),
            itemCount: responseCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => ItemCategory(
              index: index,
              category: responseCategories[index],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    Key? key,
    required this.index,
    required this.category,
  }) : super(key: key);

  final int index;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86.0,
      margin: const EdgeInsets.only(left: 10.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: index == 0 ? AppColors.yellow : AppColors.blacklight,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            category.path,
            width: 40.0,
            color: index != 0 ? Colors.white54 : null,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: index == 0 ? Colors.black : Colors.white54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
