import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/login_screen.dart';
import './screens/main_screen.dart';
import './screens/second_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFF3D2C8D),
              onPrimary: Colors.white,
              secondary: const Color(0xFF3D2C8D),
              tertiary: const Color(0xFF916BBF),
            ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // home: const MainScreen(),
      routes: {
        "/": (context) => const MainScreen(),
        "/login": (context) => const LoginScreen(),
        "/second-screen": (context) => const SecondScreen(),
      },
      initialRoute: "/",
    );
  }
}
