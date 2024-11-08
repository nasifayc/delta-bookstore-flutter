import 'package:delta_ebookstore_app/controllers/bottom_nav/bottom_nav_cubit.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:delta_ebookstore_app/screens/main_screens/listening_screen.dart';
import 'package:delta_ebookstore_app/screens/main_screens/my_book_screen.dart';
import 'package:delta_ebookstore_app/screens/main_screens/reading_screen.dart';
import 'package:delta_ebookstore_app/screens/main_screens/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        String getTitle(BottomNavState state) {
          switch (state) {
            case BottomNavState.store:
              return 'Store';
            case BottomNavState.myBooks:
              return 'My Books';
            case BottomNavState.listening:
              return 'Listening';
            case BottomNavState.reading:
              return 'Reading';
            default:
              return 'Store';
          }
        }

        Widget getCurrentScreen(BottomNavState state) {
          switch (state) {
            case BottomNavState.store:
              return const StoreScreen();
            case BottomNavState.myBooks:
              return const MyBookScreen();
            case BottomNavState.listening:
              return const ListeningScreen();
            case BottomNavState.reading:
              return const ReadingScreen();
            default:
              return const StoreScreen();
          }
        }

        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding:
                  const EdgeInsets.all(7), // Add left padding for the avatar
              child: CircleAvatar(
                backgroundColor: appTheme.secondary,
                child: const Text('N'),
              ),
            ),
            elevation: 1,
            title: Text(
              getTitle(state),
              style: appTheme.typography.headlineSmall,
            ),
            centerTitle: true,
            actions: const [Icon(Icons.search)],
          ),
          body: getCurrentScreen(state),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: BottomNavState.values.indexOf(state),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: appTheme.secondary,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'Store',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'My Books',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.hearing),
                label: 'Listening',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded),
                label: 'Reading',
              ),
            ],
            onTap: (index) {
              context
                  .read<BottomNavCubit>()
                  .selectItem(BottomNavState.values[index]);
            },
          ),
        );
      },
    );
  }
}
