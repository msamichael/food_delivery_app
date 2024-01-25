import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/provider/checkout_provider.dart';
import 'package:food_delivery_app/services/network_helper.dart';
import 'package:provider/provider.dart';

import 'map_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final int foodCardIndex;

  CheckoutScreen({
    super.key,
    required this.foodCardIndex});
  

  final NetworkHelper networkHelper =
      NetworkHelper('https://api.routelift.com/api/test');

  String? productName;
  double? price;
  int? quantity;

  

  Future<dynamic> priceCompute(int productQuantity) async {
    dynamic productPrice = await networkHelper.getData(
        endpoint: 'products',
        index: foodCardIndex,
        value: 'productPrice');

        // http post data price
    price = productPrice;
    return productPrice * productQuantity;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kdarkgrey,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // App Bar
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                            shape: const CircleBorder(), color: Colors.grey[700]),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                            shape: const CircleBorder(), color: Colors.grey[300]),
                        child: const Text(
                          '🧡',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Food Info Column
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.67,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // checkout food name

                      getProductName(),
                      const SizedBox(height: 30),
                      // checkout food infomation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '⏰',
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(width: 5),

                              // Time to prepare
                              getPreparationTime(),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                '🔥',
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(width: 5),

                              // Calories
                              getCalories(),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                '⭐',
                                style: TextStyle(fontSize: 25),
                              ),
                              const SizedBox(width: 5),

                              //Rating
                              getRating(),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      // checkout food description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: getDescription(),
                      ),
                      const SizedBox(height: 40),
                      // checkout food buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                              padding: const EdgeInsets.symmetric(vertical:7, horizontal:5),
                              decoration: ShapeDecoration(
                                  color: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      context
                                          .read<CheckoutScreenProvider>()
                                          .decrease();
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${Provider.of<CheckoutScreenProvider>(context).productQuantity}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 14),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      context
                                          .read<CheckoutScreenProvider>()
                                          .increase();
                                    },
                                  ),
                                ],
                              )),
                          GestureDetector(
                            onTap: () {

                              // http post data quantity
                              quantity = context.read<
                                            CheckoutScreenProvider>()
                                        .productQuantity;

                              networkHelper.postData(
                                endpoint: 'checkout', 
                                body: {'productName': productName,
                                'price': price,
                                'quantity': quantity});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MapScreen()));
                            },
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                              decoration: ShapeDecoration(
                                  color: kdarkgrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Checkout',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  getTotalCheckoutPrice(context),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              // Food Image
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(), color: Colors.grey),
                  width: 210,
                  height: 210,
                  child: Hero(
                    tag: 'foodImage',
                    child: getProductImage(),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<dynamic> getProductImage() {
    return FutureBuilder(
                      future: networkHelper.getData(
                          endpoint: 'products',
                          index: foodCardIndex,
                          value: 'image'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 50,
                            width: 50,
                            child: const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return Image.network(
                            snapshot.data!,
                          );
                        } else {
                          return const Text('No data');
                        }
                      });
  }

  FutureBuilder<dynamic> getTotalCheckoutPrice(BuildContext context) {
    return FutureBuilder(
                                    future: priceCompute(Provider.of<
                                            CheckoutScreenProvider>(context)
                                        .productQuantity), builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator(
                                          color: Colors.white,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text(
                                            'Error: ${snapshot.error}');
                                      } else {

                                        return Text(
                                          '\$${double.parse(snapshot.data.toStringAsFixed(2))}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold),
                                        );
                                      }
                                    });
  }

  FutureBuilder<dynamic> getDescription() {
    return FutureBuilder(
        future: networkHelper.getData(
            endpoint: 'products',
            index: foodCardIndex,
            value: 'description'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Text(snapshot.data!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.grey));
          } else {
            return const Text('No data');
          }
        });
  }

  FutureBuilder<dynamic> getRating() {
    return FutureBuilder(
        future: networkHelper.getData(
            endpoint: 'products', index: foodCardIndex, value: 'rating'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Text('${snapshot.data!}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ));
          } else {
            return const Text('No data');
          }
        });
  }

  FutureBuilder<dynamic> getCalories() {
    return FutureBuilder(
        future: networkHelper.getData(
            endpoint: 'products',
            index: foodCardIndex,
            value: 'calories'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Text('${snapshot.data!}' + ' calories',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ));
          } else {
            return const Text('No data');
          }
        });
  }

  FutureBuilder<dynamic> getPreparationTime() {
    return FutureBuilder(
        future: networkHelper.getData(
            endpoint: 'products',
            index: foodCardIndex,
            value: 'timeToPrepare'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Text('${snapshot.data!}' + ' min',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ));
          } else {
            return const Text('No data');
          }
        });
  }

  FutureBuilder<dynamic> getProductName() {
    return FutureBuilder(
        future: networkHelper.getData(
            endpoint: 'products',
            index: foodCardIndex,
            value: 'productName'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {

            // http post data productName
            productName = snapshot.data;
            return Text(snapshot.data!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                    ));
          } else {
            return const Text('No data');
          }
        });
  }
}
