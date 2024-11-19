import 'dart:developer';

import 'package:delta_ebookstore_app/controllers/theme/theme_cubit.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftNavBar extends StatelessWidget {
  const LeftNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Nasifay Chala"),
            accountEmail: const Text("nasifayc11@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: theme.primaryBackground,
              child: ClipOval(
                child: Image.asset('assets/images/boy.png'),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/nav_background.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.card_giftcard_outlined,
              color: theme.primary,
            ),
            title: Text(
              'Gifts',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_outline_rounded,
              color: theme.primary,
            ),
            title: Text(
              'Wishlist',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.download,
              color: theme.primary,
            ),
            title: Text(
              'Downloads',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.wb_sunny,
              color: theme.primary,
            ),
            title: Text(
              'Light theme',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {
              final themeCubit = context.read<ThemeCubit>();
              final isDarkMode = themeCubit.state == ThemeMode.dark;
              log(isDarkMode.toString()); // Access state
              themeCubit.toggleTheme(!isDarkMode); // Toggle the theme
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: theme.primary,
            ),
            title: Text(
              'Settings',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: theme.primary,
            ),
            title: Text(
              'About Us',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: theme.primary,
            ),
            title: Text(
              'Logout',
              style: theme.typography.headlineSmall.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const Onboarding()), // Your main screen widget
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
