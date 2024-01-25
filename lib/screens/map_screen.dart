import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                  Container(
                    
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Colors.white
                                ),
                    child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),),
                  Container(
                    padding: EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Colors.grey[300]
                                ),
                    child: Icon(Icons.my_location_rounded),
                  ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
          
                      height: MediaQuery.of(context).size.height*0.35,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50), 
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
          
                      ),
                      // padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(30),
                      // Delivery time
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.grey[300]
                              ),
                              child: Icon(Icons.access_time, color: Colors.black,)),
                            title: Text('10 - 15 min', style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text('Delivery Time',style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.grey[300]
                              ),
                                child: Icon(Icons.location_on_outlined, color: Colors.black)),
                              title: Text('70 Washington Square',style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('Delivery address',style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: kdarkgrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              
                            ),
                            child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('lib/assets/images/display_pic.jpg',),),
                            title: Text('Jordan Kieth',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            subtitle: Text('Courier',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(horizontal:10, vertical:15),
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.grey[700]
                              ),
                              child: Icon(Icons.phone_enabled, color: Colors.green[400],)),
                          ),
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],),
            ],
          ),
        ),
      ),
    );
  }
}