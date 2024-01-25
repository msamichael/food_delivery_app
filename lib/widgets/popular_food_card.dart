import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/network_helper.dart';

// var net = networkHelper.getData(endpoint: '/products', index: 1, value: '');

class PopularFoodCard extends StatelessWidget {
  
final NetworkHelper networkHelper = NetworkHelper('https://api.routelift.com/api/test');


 final int index;
//  final String value;
 final void Function()? onTap;


 PopularFoodCard({
    super.key,
    required this.index,
    // required this.value,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onTap ,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(14),
              
              height: 250 * 3.5/5,
              width: 150,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 10.0)],
            
    
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  //Product Name
                  
                    FutureBuilder(
                future: networkHelper.getData(endpoint: 'products', index: index, value: 'productName'),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
        
          return Text('Loading...');
      } else if (snapshot.hasError){
                    return Text ('Error: ${snapshot.error}');
                  }else if (snapshot.hasData){
                    return Text(
                      snapshot.data!,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                    );
                  }else{
                    return Text('No data');
                  }
                }),
                 
                  SizedBox(height:10),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Price

                    FutureBuilder(
                future: networkHelper.getData(endpoint: 'products', index: index, value: 'productPrice'),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
        
          return Text('Loading...');
      } else if (snapshot.hasError){
                    return Text ('Error: ${snapshot.error}');
                  }else if (snapshot.hasData){
                    return Text(
                      '\$' + '${snapshot.data!}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                                    );
                  }else{
                    return Text('No data');
                  }
                }),Text('🌶', style: TextStyle(fontSize: 25),),
                    ],),
                    SizedBox(height:10),
      
                ]),
      
              
            ),
          ),

          // Food Image
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.grey) ,
              width: 120,
              height:120,
              child: Hero(
                tag: 'foodImage',
                child: FutureBuilder(
                  future: networkHelper.getData(endpoint: 'products', index: index, value: 'image'),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting){
                      return Container(
                        height: 50,
                        width:50,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          
                      
                        ),
                      );
                    }else if (snapshot.hasError){
                      return Text ('Error: ${snapshot.error}');
                    }else if (snapshot.hasData){
                      return Image.network(
                        snapshot.data!,
                                      );
                    }else{
                      return Text('No data');
                    }
                  }),
              )
            ),
          ),
        ],
      ),
    );
  }
}