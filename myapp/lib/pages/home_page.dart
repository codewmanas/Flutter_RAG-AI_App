import 'package:flutter/material.dart';
import 'package:myapp/theme/colors.dart';
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
          Expanded(
            child: Column(
              children: [
                           Expanded(child: SearchSection()),  
                         // Footer
                         Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('Pro', style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.footerGrey,
                                ),),
                                ),
                                Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('Enterprise', style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.footerGrey,
                                ),),
                                ),
                                Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('Store', style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.footerGrey,
                                ),),
                                ),
                                Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('Blog', style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.footerGrey,
                                ),),
                                ),
                                Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('Careers', style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.footerGrey,
                                ),),
                                ),
                                Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text('English (English)', style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.footerGrey,
                                ),),
                                ),
                            ],
                          ),
                         ),
            ],),
          )
            
        ] ,
      ),
    );

  }
}
