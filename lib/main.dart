import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notetake/core/constants/app_colors.dart';
import 'package:notetake/note/presentation/pages/home_screen.dart';
import 'package:notetake/note/presentation/pages/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: AppColors.splashColor),
        ),
        home: const RoutePath(),
      ),
    );
  }
}

class RoutePath extends StatefulWidget {
  const RoutePath({super.key});

  @override
  State<RoutePath> createState() => _RoutePathState();
}

class _RoutePathState extends State<RoutePath> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
            // MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Center(child: SvgPicture.asset('assets/icons/note_splash.svg')),
    );
  }
}
