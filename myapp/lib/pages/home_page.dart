import 'package:flutter/material.dart';
import 'package:myapp/widgets/search_box.dart';
import 'package:myapp/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children:[
             // side NavBar
          const Sidebar(),
          Column(children: [
                        const Expanded(child: SearchSection()),  
                       // Footer
                       Container(
                        height: 20,
                       ),
          ],)
            
        ] ,
      ),
    );

  }
}
