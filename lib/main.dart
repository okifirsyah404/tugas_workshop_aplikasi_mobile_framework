import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/screens/main_screen.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TSA Polije',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.blue,
              secondary: Colors.blue,
            ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .copyWith(),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
