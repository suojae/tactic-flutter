import 'package:chat_sdk/shared/design/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/onboarding/presentation/onboarding_cubit.dart';
import 'features/onboarding/presentation/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final prefs = await SharedPreferences.getInstance();
  final hasCompletedOnboarding =
      prefs.getBool('has_completed_onboarding') ?? false;
  final themeManager = await ThemeManager.create();

  runApp(MyApp(
    hasCompletedOnboarding: hasCompletedOnboarding,
    themeManager: themeManager,
  ));
}

class MyApp extends StatelessWidget {
  final bool hasCompletedOnboarding;
  final ThemeManager themeManager;

  const MyApp({
    super.key,
    required this.hasCompletedOnboarding,
    required this.themeManager,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(create: (_) => themeManager),
      ],
      child: BlocBuilder<ThemeManager, AppThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.lightTheme,
            darkTheme: ThemeManager.darkTheme,
            themeMode: state is Dark ? ThemeMode.dark : ThemeMode.light,
            home: hasCompletedOnboarding
                ? const HomeScreen()
                : const OnboardingScreen(),
          );
        },
      ),
    );
  }
}

/// 📌 온보딩 완료 후 이동할 홈 화면 (예제)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("홈")),
      body: const Center(child: Text("온보딩 완료!")),
    );
  }
}
