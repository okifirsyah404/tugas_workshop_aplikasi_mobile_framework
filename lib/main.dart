import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/screens/home_screen.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/screens/login_screen.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/screens/register_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tugas Workshop",
      theme: ThemeData.light().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Color(0xFF8BC6EC),
              primary: Color(0xFF9599E2),
            ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
