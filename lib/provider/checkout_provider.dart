import 'package:flutter/material.dart';

class CheckoutScreenProvider extends ChangeNotifier {
  int productQuantity =1;


  void increase() async{
    productQuantity= productQuantity+1;
    notifyListeners();

  }

  void decrease() async{
    if (productQuantity > 1){
    productQuantity = productQuantity-1;
    }
    
    notifyListeners();
  }

}