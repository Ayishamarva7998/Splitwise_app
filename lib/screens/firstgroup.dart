import 'package:flutter/material.dart';
import 'package:splitwise_app/bottombar.dart';
import 'package:splitwise_app/screens/groups_screen.dart';

class Firstgroup extends StatelessWidget {
  const Firstgroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>bottombar(),));
        
       }, icon: Icon(Icons.arrow_back)),
       backgroundColor: const Color.fromARGB(255, 215, 212, 212),elevation: 0,
      ),
      body: Column(
        children: [
          const Align(alignment: Alignment.topLeft,
            child: Text('Tech house',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),SizedBox(height: 30,),
          const Align(alignment: Alignment.topRight,
            child: Text('Total Income:1069.00',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
          const Align(alignment: Alignment.topRight,
            child: Text('Total Expense:120.00',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
            SizedBox(height: 60,),

            const Align(alignment: Alignment.topLeft,
              child: Text('Oct 19',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
              SizedBox(height: 20,),
             list(icon:Icons.local_taxi,title: 'Taxi fare',text1: 'Rahma paid 50.00',text2: 'You borrowed',amount: '10.00'),
             list(icon: Icons.restaurant, title: 'Food', text1: 'Arjun paid 654.00', text2: 'You borrowed', amount: '280.00'),
             list(icon: Icons.shopping_cart, title: 'Shopping', text1: 'You paid 2549.00', text2: 'You lent', amount: ' 798.00' ),
             list(icon:Icons.local_cafe, title: 'Tea & Snacks ', text1: 'Ameer paid 160.00', text2: 'You borrowed', amount: '80.00')
        ],
        
      ),

    );
  }

  ListTile list({required IconData icon, required String title,required String text1,required String text2,required String amount  }) {
    return ListTile(leading: Icon(icon),
    title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
           subtitle: Text(text1),
           trailing: Column(
             children: [
               Text(text2,style: const TextStyle(color: Colors.red
               ),),
               SizedBox(height: 10,),
               Text(amount,style: TextStyle(color: Colors.red),)
             ],
           ),
           
           );
  }
}