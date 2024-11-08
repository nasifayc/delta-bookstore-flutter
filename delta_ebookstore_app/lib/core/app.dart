import 'package:delta_ebookstore_app/controllers/bottom_nav/bottom_nav_cubit.dart';
import 'package:delta_ebookstore_app/core/app_navigator.dart';
import 'package:delta_ebookstore_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ebook store',
        theme: LightModeTheme().themeData,
        home: const AppNavigator(),
      ),
    );
  }
}
