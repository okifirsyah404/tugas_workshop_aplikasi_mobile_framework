import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List images =
      List.generate(6, (index) => 'https://picsum.photos/id/${index}/200/300');

  Map<String, Color> imageColors = {};

  @override
  Widget build(BuildContext context) {
    for (var image in images) {
      imageColors.putIfAbsent(
          image,
          () => Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)));
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF2BFF88),
                Color(0xFF2BD2FF),
                Color(0xFFFA8BFF),
              ],
            ),
          ),
          child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Hero(
                  tag: images[index],
                  child: GestureDetector(
                    child: Center(
                      child: SizedBox(
                        height: 440,
                        width: 300,
                        child: Card(
                          margin: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: imageColors.values.elementAt(index),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  images[index],
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Gambar ${index + 1}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Halamandua(
                          gambar: images[index],
                          colors: imageColors.values.elementAt(index),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  const Halamandua({super.key, required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  State<Halamandua> createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  Color? warna;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BT21"),
        backgroundColor: warna ?? widget.colors,
        actions: [
          PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan x) {
                return PopupMenuItem<Pilihan>(
                  value: x,
                  child: Text(x.teks),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            colors: [
              // Colors.purple,
              Colors.white,
              warna ?? widget.colors,
            ],
          ),
        ),
        child: Center(
          child: Hero(
            tag: widget.gambar,
            child: ClipOval(
                child: SizedBox(
              width: 200.0,
              height: 200.0,
              child: Material(
                child: InkWell(
                  // onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    color: warna ?? widget.colors,
                    child: Image.network(
                      widget.gambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  Pilihan(teks: 'Red', warna: Colors.red),
  Pilihan(teks: 'Green', warna: Colors.green),
  Pilihan(teks: 'Blue', warna: Colors.blue),
];
