import 'package:flutter/material.dart';


class FoodSelectionProvider extends ChangeNotifier{
  int  selectedFoodCardIndex;

  FoodSelectionProvider({
    this.selectedFoodCardIndex = 0,
  });

  void changeFoodCard({required int newSelectedFoodCard,
 })async{
  selectedFoodCardIndex = newSelectedFoodCard;
  notifyListeners();
     }
                        
}