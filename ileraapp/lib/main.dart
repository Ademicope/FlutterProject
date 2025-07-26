import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/role_selection_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const IleraApp());
}

class IleraApp extends StatelessWidget {
  const IleraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/role': (context) => const RoleSelectionScreen(),
        '/register': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return SignupScreen(userRole: args['role']);
        },
      },
    );
  }
}