import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/provider/checkout_provider.dart';
import 'package:food_delivery_app/provider/food_selection_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => FoodSelectionProvider()),),
        ChangeNotifierProvider(create: ((context) => CheckoutScreenProvider()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            headlineMedium: TextStyle(color: kdarkgrey),
          ),
        ),
        home: Scaffold(
          backgroundColor: kashgrey,
          body:  HomeScreen(),
        ),
      ),
    );
  }
}
