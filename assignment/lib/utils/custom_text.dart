import 'package:flutter/material.dart';

import '../utils/responsive_size.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool isDefault;
  final bool isSmall;
  final bool isSelected;
  final TextStyle? style;
  final double? screenWidth;

  const CustomText(
    this.text, {
    super.key,
    this.isHeader = false,
    this.isDefault = true,
    this.isSmall = false,
    this.isSelected = false,
    this.style,
    this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final double currentWidth = screenWidth ?? ResponsiveUtil.getWidth(context);

    TextStyle resolvedStyle = style ?? _getBaseStyle(context);

    // Only override color and font size if style is not provided
    if (style == null) {
      resolvedStyle = resolvedStyle.copyWith(
        color:
            isSelected ? Colors.blue : (isDefault ? Colors.black : Colors.grey),
        fontSize: _getResponsiveFontSize(currentWidth),
      );
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: resolvedStyle,
    );
  }

  TextStyle _getBaseStyle(BuildContext context) {
    if (isHeader) {
      return Theme.of(context).textTheme.bodyLarge ??
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    } else if (isSmall) {
      return Theme.of(context).textTheme.bodySmall ??
          const TextStyle(fontSize: 12);
    } else {
      return Theme.of(context).textTheme.labelLarge ??
          const TextStyle(fontSize: 16);
    }
  }

  double _getResponsiveFontSize(double width) {
    if (width < 600) {
      return isSmall ? 12 : 16;
    } else if (width < 1200) {
      return isSmall ? 14 : 18;
    } else {
      return isSmall ? 16 : 20;
    }
  }
}
