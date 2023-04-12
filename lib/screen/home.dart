import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/model/categories_model.dart';
import 'package:trendy_fashion/utils/constants.dart';
import 'package:animate_do/animate_do.dart';

import '../data/app_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInUp(
                  delay: Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Find your',
                            style: TextStyle(color: Colors.red, fontSize: 36),
                            children: [
                              TextSpan(
                                text: 'Style',
                                style: theme.bodySmall?.copyWith(
                                  color: primaryColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Be more beautiful with our  ',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                            children: [
                              TextSpan(
                                text: 'suggestions:)',
                                style: theme.bodySmall?.copyWith(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40,),
                  width: size.width,
                  height: size.height* 0.14,
                  color: Colors.blue,
                  child: ListView.builder(
                   
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                   itemCount: categories.length,
                    itemBuilder: (context,index){
                      CategoriesModel current = categories[index];
                   return Column(
                    children: [
                 CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(current.imageUrl),
                 
                 ),
                  SizedBox(height: size.height*0.008,),
                  Text(
                    current.title,
                    style: theme.bodyMedium,
                  )
                    ],
                   );
                    },),
                ),
              ],
            ),
          ),
        ));
  }
}
