import 'package:assignment/components/explore_card.dart';
import 'package:assignment/getx_setup/routing.dart';
import 'package:assignment/modules/home_screen/controller.dart';
import 'package:assignment/utils/custom_app_bar.dart';
import 'package:assignment/utils/custom_image.dart';
import 'package:assignment/utils/custom_scaffold.dart';
import 'package:assignment/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/expert_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return CustomScaffold(
              showAppBar: false,
              title: '',
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: '  ',
                      backgroundColor: Colors.white,
                      elevation: 1,
                      leading: const CustomImage(
                        assetPath: 'assets/signs/logo.svg',
                      ),
                      actions: [
                        InkWell(
                          onTap: () {},
                          child: const CustomImage(
                            assetPath: 'assets/signs/search.svg',
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const CustomImage(
                            assetPath: 'assets/signs/Notification.svg',
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const CustomImage(
                                    assetPath: 'assets/signs/wallet-02.svg',
                                    height: 20,
                                  ),
                                  CustomText('100 ₹'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    signsView(controller, context),
                    const SizedBox(height: 200),
                    zodaicExplore(controller, context),
                    expertCode(controller, context),
                  ],
                ),
              ));
        });
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  SingleChildScrollView signsView(
      HomeController controller, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: controller.sign.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImage(
                        assetPath: e.image,
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        e.name,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Sign View Widget
  Widget zodaicExplore(HomeController controller, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.liveZodiacData.map((e) {
                return LiveZodiacCard(
                    title: e.title,
                    userName: e.userName,
                    userImagePath: e.userImagePath,
                    viewsCount: e.viewsCount);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  expertCode(HomeController controller, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              const Text(
                'Our Experts',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.tune, size: 24),
                onPressed: () {},
                tooltip: 'Filter',
              ),
            ],
          ),
        ),
        Wrap(
          children: controller.expertCardData.map((model) {
            return ExpertCard(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.expertProfile);
              },
              name: model.name,
              rating: model.rating,
              experienceYears: model.experienceYears,
              pricePerMin: model.pricePerMin,
              originalPrice: model.originalPrice,
              isOnline: model.isOnline,
            );
          }).toList(),
        ),
      ],
    );
  }
}
