
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/provider/food_selection_provider.dart';
import 'package:food_delivery_app/screens/checkout_screen.dart';
import 'package:food_delivery_app/widgets/food_selection_card.dart';
import 'package:food_delivery_app/widgets/popular_food_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedBottomNavBarIndex =0;

  

Widget _buildBottomNavigationBar(){
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft:Radius.circular(20),
      topRight:Radius.circular(20),),
    child: BottomNavigationBar(
      currentIndex: selectedBottomNavBarIndex,
      backgroundColor: kdarkgrey,
      onTap: (index) {
        setState(() {
        selectedBottomNavBarIndex = index;
          
        }
        );
      }, 
      
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(icon:Icon(Icons.room_service_outlined, size: 25, ) , label: ''),
        const BottomNavigationBarItem(icon:Icon(Icons.search, size:25, ) , label: ''),
        const BottomNavigationBarItem(icon:Icon(Icons.favorite_border_rounded, size: 25,) , label: ''),
        const BottomNavigationBarItem(icon:Icon(Icons.view_day_outlined, size: 25,) , label: ''),
    
    
    ]),
  );

}

  @override
  Widget build(BuildContext context) {
    
      

      return Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(),
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            
            children: [
              const SizedBox(height:25),
              // App Bar
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu_rounded,
                  ),
                  CircleAvatar(
                    
                    backgroundImage: AssetImage('lib/assets/images/avatar.png'),
                  )
                ],
              ),
          
              const SizedBox(height: 20),
              // Text Intro
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Good food.',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    ),
                ),
                Text(
                  'Fast delivery.',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    ),
                ),
               
              ]),
              const SizedBox(height: 30),
    
              // Food Selection Row
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   FoodSelectionCard(
                        imagePath: 'lib/assets/images/meatpie.png',
                        imageText: 'Main',
                         color: Provider.of<FoodSelectionProvider>(context).selectedFoodCardIndex == 1 ? const Color(0xFF282D32) : Colors.white,
                        onSelect:(){
                          context.read<FoodSelectionProvider>().changeFoodCard(
                            newSelectedFoodCard: 1
                          );
                        },
                      ),
                   FoodSelectionCard(
                        imagePath: 'lib/assets/images/soup.png',
                        imageText: 'Soups',
                         color: Provider.of<FoodSelectionProvider>(context).selectedFoodCardIndex == 2 ? const Color(0xFF282D32) : Colors.white,
                        onSelect:(){
                          context.read<FoodSelectionProvider>().changeFoodCard(
                            newSelectedFoodCard: 2
                          );
                        },
                      ),
                   FoodSelectionCard(
                        imagePath: 'lib/assets/images/salad.png',
                        imageText: 'Salads',
                         color: Provider.of<FoodSelectionProvider>(context).selectedFoodCardIndex == 3 ? const Color(0xFF282D32) : Colors.white,
                        onSelect:(){
                          context.read<FoodSelectionProvider>().changeFoodCard(
                            newSelectedFoodCard: 3
                          );
                        },
                      ),
                   FoodSelectionCard(
                        imagePath: 'lib/assets/images/drink.png',
                        imageText: 'Drinks',
                         color: Provider.of<FoodSelectionProvider>(context).selectedFoodCardIndex == 4 ? const Color(0xFF282D32) : Colors.white,
                        onSelect:(){
                          context.read<FoodSelectionProvider>().changeFoodCard(
                            newSelectedFoodCard: 4
                          );
                        },
                      ),
                  
                 ],
               ),
                
                 
              
              const SizedBox(height: 30),
              // Popular Section
          
              const Text(
                'Popular now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
          
              const SizedBox(height: 20),
              Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PopularFoodCard(
                      index: 0, 
                      onTap: () {
                        int foodCardIndex = 0;
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> CheckoutScreen(foodCardIndex: foodCardIndex)));
                      },
                      ),
                      const SizedBox(width: 20),
                      
                    PopularFoodCard(
                      index: 1, 
                      onTap: () {
                        int foodCardIndex = 1;
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> CheckoutScreen(foodCardIndex: foodCardIndex)));
                      },
                      ),
                      const SizedBox(width: 20),
                    PopularFoodCard(
                      index: 2, 
                      onTap: () {
                        int foodCardIndex = 2;
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> CheckoutScreen(foodCardIndex: foodCardIndex)));
                      },
                      ),
                    
                    
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ));
      }
      
    
  }

