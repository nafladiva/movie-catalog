import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:gowatch/presentation/widgets/widgets.dart';

import 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController pageController;
  late List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = const [
      MoviePage(),
      TVShowPage(),
      WatchlistPage(),
    ];

    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screenList,
      ),
      bottomNavigationBar: GoogleNavbar(pageController: pageController),
    );
  }
}
