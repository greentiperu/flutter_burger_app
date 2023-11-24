import 'package:flutter/material.dart';
import 'package:flutter_app_burger/ui/components/title_page.dart';
import 'package:flutter_app_burger/ui/views/home/widgets/header.dart';
import 'package:flutter_app_burger/ui/views/home/widgets/menu_navigation_bar.dart';
import 'package:flutter_app_burger/ui/views/home/widgets/offers.dart';
import 'package:flutter_app_burger/ui/views/home/widgets/recommends.dart';
import 'package:flutter_app_burger/ui/views/home/widgets/search.dart';
import 'package:flutter_app_burger/ui/views/home/widgets/select_category.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  Header(),
                  Search(),
                  SelectCategory(),
                  TitlePage(title: "Recommended"),
                  Recommends(),
                  TitlePage(title: "Especial offers"),
                  Offers(),
                  SliverToBoxAdapter(child: SizedBox(height: 60.0)),
                ],
              ),
            ),
            MenuNavigationBar(),
          ],
        ),
      ),
    );
  }
}
