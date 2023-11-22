import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wishing_well/pages/home/home.dart';

import 'app_bloc_observer/app_bloc_observer.dart';
import 'route/routes.dart';
import 'theme/theme_cubit.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runZonedGuarded(
    () => runApp(const App()),
    (error, stack) => log(error.toString(), stackTrace: stack),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(),
          ),
        ],
        child: ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0, end: 480, name: MOBILE),
            Breakpoint(start: 481, end: 800, name: TABLET),
            Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
          ],
        ),
      ),
      routerConfig: Routes.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
