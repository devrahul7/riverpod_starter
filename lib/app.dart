import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/screens/dashboard_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ProviderScope wraps the entire MaterialApp so Riverpod states are accessible everywhere
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Optional: Removes the red debug banner
        title: 'Flutter Riverpod Starter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}