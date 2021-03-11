import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    myapp()
  );
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
         child : Column (
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CircleAvatar(
              radius: 50.0,
               backgroundImage: AssetImage('images/pola.jpg'),

             ),
             Text(
                 'pola kamal',
                 style: TextStyle(
                 fontFamily: 'Pacifico',
                 fontSize: 40.0,
                 color: Colors.white,
                 fontWeight: FontWeight.bold
                 ),

             ),
             Text(
              'Flutter Developer',
             style: TextStyle (
               fontFamily: 'SourceSansPro',
               color: Colors.teal.shade100,
               fontSize: 20.0,
               letterSpacing: 2.5,
               fontWeight: FontWeight.bold,
             ),
            ),
             SizedBox(height: 20.0,
               width: 150.0
               ,child: Divider(
             color: Colors.teal.shade100,
              ),
             ),
             Card(
               color: Colors.white,
               margin: EdgeInsets.symmetric(
                 vertical: 10.0,
                 horizontal: 25.0
               ),


                 child: ListTile(

                    leading: Icon(
                         Icons.phone,
                       color: Colors.teal,

                     ),


                    title : Text('01201048094' , style: TextStyle(
                       color: Colors.teal.shade900,
                       fontFamily: 'SourceSansPro',
                       fontSize: 20.0,
                     ),
                     )


                 ),
               ),
             Card(
               color: Colors.white,
               margin: EdgeInsets.symmetric(
                   vertical: 10.0,
                   horizontal: 25.0
               ),
               child: ListTile(
                 leading:  Icon(
                     Icons.email,
                     color: Colors.teal,

                   ),

                   title: Text('polakamal82@gmail.com' , style: TextStyle(
                     color: Colors.teal.shade900,
                     fontFamily: 'SourceSansPro',
                     fontSize: 20.0,
                   ),
                   )
               ),
             ),
           ],
         ),
        ),
      ),
    );
  }
}

