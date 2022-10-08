import 'dart:math';

import 'package:flutter/material.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Belajar MaterialApp Scaffold"),
//       ),
//     );
//   }
// }

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: const Icon(Icons.dashboard),
    //     title: const Text("Belajar MaterialApp Scaffold"),
    //     actions: const [
    //       Icon(Icons.search),
    //     ],
    //     actionsIconTheme: const IconThemeData(color: Colors.yellow),
    //     backgroundColor: Colors.pinkAccent,
    //     bottom: PreferredSize(
    //         preferredSize: const Size.fromHeight(4.0),
    //         child: Container(
    //           color: Colors.orange,
    //           height: 4.0,
    //         )),
    //     centerTitle: true,
    //   ),
    //   // body: const ColumnBody(),
    // );

    // PERUBAHAN BARU

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dashboard),
        title: Text("Belajar MaterialApp Scaffold"),
        actions: [Icon(Icons.search)],
        actionsIconTheme: IconThemeData(color: Colors.yellow),
        backgroundColor: Colors.pinkAccent,
        bottom: PreferredSize(
            child: Container(
              color: Colors.orange,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        centerTitle: true,
      ),
      //PERUBAHAN BARU
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Text('+'),
        onPressed: () {},
      ),
      body: ColumnRow(),
    );
  }
}

class ColumnBody extends StatelessWidget {
  const ColumnBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // padding: EdgeInsets.all(10),
          // margin: EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
      ],
    );
  }
}

class RowBody extends StatelessWidget {
  const RowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
      ],
    );
  }
}

class ColumnRow extends StatelessWidget {
  const ColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
              shape: BoxShape.circle),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
                shape: BoxShape.circle),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                  shape: BoxShape.circle),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                  shape: BoxShape.circle),
            ),
            Container(
              margin: EdgeInsets.all(30),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256)),
                  shape: BoxShape.circle),
            ),
          ],
        ),
      ],
    );
  }
}
