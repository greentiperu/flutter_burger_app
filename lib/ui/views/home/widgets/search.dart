import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_burger/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          decoration: BoxDecoration(
            color: AppColors.blacklight,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/fast_food/search.svg',
                color: Colors.white70,
                height: 25.0,
              ),
              Expanded(
                child: CupertinoTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: const BoxDecoration(),
                  placeholder: "Search here...",
                  placeholderStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white54,
                            fontWeight: FontWeight.w300,
                          ),
                  cursorColor: AppColors.yellow,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
