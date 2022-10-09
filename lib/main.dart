import 'package:flutter/material.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Framework Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      // routes: {
      //   "/": (context) => HomePage(),
      //   "/about": (context) => AboutPage(),
      // },
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
