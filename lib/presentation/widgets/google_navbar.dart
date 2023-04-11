import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gowatch/common/common.dart';
import 'package:gowatch/presentation/cubit/navbar/navbar_cubit.dart';

class GoogleNavbar extends StatefulWidget {
  const GoogleNavbar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<GoogleNavbar> createState() => _GoogleNavbarState();
}

class _GoogleNavbarState extends State<GoogleNavbar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        return GNav(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          tabMargin:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 7.0),
          activeColor: Themes.defaultColor,
          rippleColor: Colors.grey[300]!,
          tabBackgroundColor: Themes.primaryColor.withOpacity(0.2),
          backgroundColor: Colors.white,
          iconSize: 24,
          gap: 5,
          selectedIndex: state,
          onTabChange: (index) {
            BlocProvider.of<NavbarCubit>(context).changeIndex(index);
            widget.pageController.jumpToPage(index);
          },
          tabs: [
            GButton(
              icon: Icons.movie,
              text: 'Movie',
              iconColor: state == 0
                  ? Themes.defaultColor
                  : Themes.defaultColor.withOpacity(0.3),
            ),
            GButton(
              icon: Icons.tv,
              text: 'TV Show',
              iconColor: state == 1
                  ? Themes.defaultColor
                  : Themes.defaultColor.withOpacity(0.3),
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Watchlist',
              iconColor: state == 2
                  ? Themes.defaultColor
                  : Themes.defaultColor.withOpacity(0.3),
            ),
          ],
        );
      },
    );
  }
}
