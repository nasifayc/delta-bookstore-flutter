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
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              color: theme.primaryText,
            ),
            title: Text(
              'Categories',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to Categories
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: theme.primaryText,
            ),
            title: Text(
              'Wishlist',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to Wishlist
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.library_books,
          //     color: theme.primaryText,
          //   ),
          //   title: Text(
          //     'My Library',
          //     style: theme.typography.bodySmall,
          //   ),
          //   onTap: () {
          //     // Navigate to Purchased Books
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.download,
              color: theme.primaryText,
            ),
            title: Text(
              'Downloads',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to Downloads
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: theme.primaryText,
            ),
            title: Text(
              'Account',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to Account
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.history,
          //     color: theme.primaryText,
          //   ),
          //   title: Text(
          //     'Orders',
          //     style: theme.typography.bodySmall,
          //   ),
          //   onTap: () {
          //     // Navigate to Purchase History
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.wb_sunny,
              color: theme.primaryText,
            ),
            title: Text(
              'Light theme',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to Notifications
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: theme.primaryText,
            ),
            title: Text(
              'Settings',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to Settings
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: theme.primaryText,
            ),
            title: Text(
              'About Us',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Navigate to About Us
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: theme.primaryText,
            ),
            title: Text(
              'Logout',
              style: theme.typography.bodySmall,
            ),
            onTap: () {
              // Handle Logout
            },
          ),
        ],
      ),
    );
  }
}
