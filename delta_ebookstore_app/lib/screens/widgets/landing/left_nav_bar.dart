import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

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
                // borderRadius:
                //     BorderRadius.only(bottomRight: Radius.circular(70)),
                image: DecorationImage(
                    image: AssetImage("assets/images/nav_background.jpg"),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
