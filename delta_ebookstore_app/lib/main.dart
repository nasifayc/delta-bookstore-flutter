import 'package:delta_ebookstore_app/controllers/auth/auth_cubit.dart';
import 'package:delta_ebookstore_app/controllers/bottom_nav/bottom_nav_cubit.dart';
import 'package:delta_ebookstore_app/controllers/search/search_cubit.dart';
import 'package:delta_ebookstore_app/controllers/theme/theme_cubit.dart';
import 'package:delta_ebookstore_app/controllers/user/user_cubit.dart';
import 'package:delta_ebookstore_app/core/main_app.dart';
import 'package:delta_ebookstore_app/services/auth/auth_service.dart';
import 'package:delta_ebookstore_app/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthCubit(authService: AuthService()),
      ),
      BlocProvider(
        create: (context) => UserCubit(
          userService: UserService(),
          authCubit: BlocProvider.of<AuthCubit>(context),
        ),
      ),
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(create: (context) => BottomNavCubit()),
      BlocProvider(create: (context) => SearchCubit()),
    ],
    child: const MainApp(),
  ));
}
