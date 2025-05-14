import 'package:assignment/theme/constants.dart';
import 'package:assignment/utils/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/custom_text.dart';
import '../utils/responsive_size.dart';

class ProfileStatsCard extends StatelessWidget {
  final double rating;
  final int experienceYears;
  final String followers;
  final String callMinutes;
  final String chatMinutes;
  final VoidCallback onFollowTap;

  const ProfileStatsCard({
    super.key,
    required this.rating,
    required this.experienceYears,
    required this.followers,
    required this.callMinutes,
    required this.chatMinutes,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: EdgeInsets.all(width < 600 ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat(
                  context,
                  icon: Icons.star,
                  iconColor: Colors.amber,
                  value: rating.toStringAsFixed(1),
                  label: "Rating",
                ),
                _buildStat(
                  context,
                  value: experienceYears.toString(),
                  label: "Experience",
                ),
                _buildStat(
                  context,
                  value: followers,
                  label: "Followers",
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(CupertinoIcons.phone, color: Constants.primary),
                    const SizedBox(width: 6),
                    CustomText(
                      '$callMinutes mins',
                      isSmall: true,
                      style: TextStyle(
                        color: Colors.brown.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    CustomImage(
                      assetPath: 'assets/signs/Chat.svg',
                      height: 26,
                    ),
                    const SizedBox(width: 6),
                    CustomText(
                      '$chatMinutes mins',
                      isSmall: true,
                      style: TextStyle(
                        color: Colors.brown.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: onFollowTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Follow",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context,
      {IconData? icon,
      Color? iconColor,
      required String value,
      required String label}) {
    return Row(
      children: [
        if (icon != null)
          Icon(icon, color: iconColor ?? Colors.black, size: 20),
        if (icon != null) const SizedBox(width: 4),
        CustomText(
          value,
          isDefault: true,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(width: 4),
        CustomText(
          label,
          isSmall: true,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
