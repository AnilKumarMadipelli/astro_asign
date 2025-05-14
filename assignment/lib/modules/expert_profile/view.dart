import 'package:assignment/modules/expert_profile/controller.dart';
import 'package:assignment/utils/custom_app_bar.dart';
import 'package:assignment/utils/custom_icon_button.dart';
import 'package:assignment/utils/custom_scaffold.dart';
import 'package:assignment/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/profile_stat_card.dart';

class ExpertProfilePage extends StatefulWidget {
  const ExpertProfilePage({super.key});

  @override
  State<ExpertProfilePage> createState() => _ExpertProfilePageState();
}

class _ExpertProfilePageState extends State<ExpertProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Rakesh Kaushik',
        showAppBar: false,
        body: Column(
          children: [
            CustomAppBar(
              title: 'Rakes Kaushik',
              isOnline: true,
              actions: [
                CustomIconButton(
                  icon: Icons.share,
                  iconColor: Colors.white,
                  elevation: 0,
                  onPressed: () {},
                  backgroundColor: const Color(0xFF0054DC),
                ),
                CustomIconButton(
                  icon: Icons.more_vert,
                  iconSize: 28,
                  iconColor: Colors.white,
                  elevation: 0,
                  onPressed: () {},
                  backgroundColor: const Color(0xFF0054DC),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            const CustomText(
              'Rakesh Kaushik',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              isHeader: true,
            ),
            ProfileStatsCard(
              rating: 4.2,
              experienceYears: 10,
              followers: '10K',
              callMinutes: '9k',
              chatMinutes: '22k',
              onFollowTap: () {
                print('Follow clicked');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: CustomText(
                  'Images',
                  isHeader: true,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: imageComponent(context),
            )
          ],
        ));
  }

  @override
  void dispose() {
    Get.delete<ExpertController>();
    super.dispose();
  }

  Widget imageComponent(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 150, // give it height so it's visible
          width: 150,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          child: Center(child: CustomText(index.toString())),
        );
      },
    );
  }
}
