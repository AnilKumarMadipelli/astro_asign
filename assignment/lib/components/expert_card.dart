import 'package:flutter/material.dart';

import '../utils/custom_text.dart';

class ExpertCard extends StatelessWidget {
  final String name;
  final double rating;
  final int experienceYears;
  final double pricePerMin;
  final double? originalPrice;
  final VoidCallback onPressed;
  final bool isOnline;

  const ExpertCard({
    super.key,
    required this.name,
    required this.onPressed,
    required this.rating,
    required this.experienceYears,
    required this.pricePerMin,
    this.originalPrice,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 180,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            isOnline
                ? const Icon(Icons.circle, color: Colors.green, size: 12)
                : const SizedBox(
                    height: 11,
                  ),
            const SizedBox(height: 80),
            CustomText(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Rating : ',
                  style: const TextStyle(color: Colors.grey),
                ),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                CustomText(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 4),
            CustomText(
              'Exp : $experienceYears years',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    '${pricePerMin.toStringAsFixed(0)}₹/min',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  if (originalPrice != null)
                    CustomText(
                      '${originalPrice!.toStringAsFixed(0)}₹/min',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
