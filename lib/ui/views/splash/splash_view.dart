import 'package:flutter/material.dart';
import 'package:flutter_app_burger/ui/components/btn_primary.dart';
import 'package:flutter_app_burger/ui/views/home/home_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: const AssetImage("assets/fast_food/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 60.0,
                bottom: 20.0,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/fast_food/burger_back.svg",
                height: 80.0,
              ),
            ),
            Center(
              child: Text(
                "BURGER",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
              ),
            ),
            Center(
              child: Text(
                "C I T Y",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white70, fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            Text(
              "World´s",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Text(
              "Greates Burgers...",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 60.0),
              child: BtnPrimary(
                text: "Get start here",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeView(),
                    ),
                    (route) => false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
