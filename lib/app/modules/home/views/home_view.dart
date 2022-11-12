import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/app/controllers/app_controller.dart';
import 'package:tugas_workshop_aplikasi_mobile_framework/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  var appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appController.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('HomeView'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.SETTING,
                        arguments:
                            "Home Page To Demo Page -> Passing arguments");
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            bottomSheet: SafeArea(
              child: Card(
                elevation: 12.0,
                margin: EdgeInsets.zero,
                child: Card(
                  elevation: 12.0,
                  margin: EdgeInsets.zero,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 65,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Icon(Icons.shopping_cart_rounded,
                                      size: 40, color: Colors.white),
                                  Positioned(
                                    right: 5,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                      // child: Center(
                                      //   child: Text(
                                      //     '${appController.cartCount}',
                                      //     style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 11.0,
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  )
                                ],
                              ),
                              // Text(
                              //   'Total Amount - ${appController.totalAmount}',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.w300,
                              //     fontSize: 20.0,
                              //   ),
                              // ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ))
                            ],
                          ))),
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://img.alicdn.com/tfs/TB1e.XyReL2gK0jSZFmXXc7iXXa-990-400.png',
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].productName,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  Text(snapshot.data![index].productDescription,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.0)),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ElevatedButton(
                          //     onPressed: () =>
                          //         appController.addToCart(controller.products[index]),
                          //     child: Text(
                          //       'Shop Now',
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.normal, fontSize: 12.0),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
