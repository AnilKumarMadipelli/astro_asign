import 'package:assignment/utils/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;
  final String? navigateToScreen;
  final bool showAppBar;
  final bool? isOnline;
  final Widget? customMenu; // Add a customMenu for large screens

  const CustomAppBar({
    super.key,
    required this.title,
    this.isOnline = false,
    this.centerTitle = false,
    this.actions,
    this.leading,
    this.backgroundColor = const Color(0xFF0054DC),
    this.elevation = 4.0,
    this.navigateToScreen,
    this.showAppBar = true,
    this.customMenu, // Custom menu widget
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return showAppBar
        ? AppBar(
            title: Row(
              children: [
                CustomText(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                if (isOnline!)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.circle,
                      size: 13,
                      color: Colors.green,
                    ),
                  )
              ],
            ),
            centerTitle: centerTitle,
            titleTextStyle: const TextStyle(color: Colors.white),
            backgroundColor: backgroundColor,
            toolbarTextStyle: TextStyle(color: Colors.white),
            elevation: elevation,
            shadowColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                margin: const EdgeInsets.all(4),
                child: leading ??
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else if (navigateToScreen != null) {
                          Navigator.pushReplacementNamed(
                              context, navigateToScreen!);
                        } else {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                    ),
              ),
            ),
            actions: screenWidth >= 1200
                ? [
                    if (customMenu != null)
                      customMenu!, // Show custom menu for large screens
                  ]
                : actions, // Show actions for small screens
          )
        : const SizedBox
            .shrink(); // Return an empty widget when AppBar is not shown
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
