import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_bottom_bar.dart';
import 'custom_text.dart';

class CustomScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final List<BottomNavigationBarItem>? bottomNavigationBarItems; // Nullable
  final bool showAppBar;
  final bool showDrawer;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBarItems,
    this.showAppBar = true, // By default, show the AppBar
    this.showDrawer = true, // By default, show the Drawer on small screens
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _selectedIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate or update content here
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width to make the layout responsive
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: widget.showAppBar
          ? CustomAppBar(
              title: widget.title,
              centerTitle: true,
              actions: screenWidth >= 1200
                  ? [
                      PopupMenuButton<String>(
                        onSelected: (String value) {
                          if (value == 'home') {
                            Navigator.pushReplacementNamed(context, '/home');
                          } else if (value == 'settings') {
                            Navigator.pushReplacementNamed(
                                context, '/settings');
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem<String>(
                            value: 'home',
                            child: ListTile(
                              leading: Icon(Icons.home),
                              title: CustomText('Home'),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'settings',
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: CustomText('Settings'),
                            ),
                          ),
                        ],
                      ),
                    ]
                  : null,
              showAppBar: widget.showAppBar,
            )
          : null,
      drawer: widget.showDrawer && screenWidth < 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.pushReplacementNamed(context, '/settings');
                    },
                  ),
                ],
              ),
            )
          : null,
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
