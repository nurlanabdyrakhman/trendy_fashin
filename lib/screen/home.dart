import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/model/categories_model.dart';
import 'package:trendy_fashion/utils/constants.dart';
import 'package:animate_do/animate_do.dart';

import '../data/app_data.dart';
import '../model/base_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return 
    Scaffold(
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
                  padding: const EdgeInsets.all(12.0),
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
              FadeInUp(
                delay: const Duration(milliseconds: 45),
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 40,
                  ),
                  width: size.width,
                  height: size.height * 0.14,
                  color: Colors.blue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      CategoriesModel current = categories[index];
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(current.imageUrl),
                          ),
                          SizedBox(
                            height: size.height * 0.008,
                          ),
                          Text(
                            current.title,
                            style: theme.bodyMedium,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: size.width,
                height: size.height * 0.45,
                color: Colors.red,
                child: PageView.builder(
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: mainList.length,
                  itemBuilder: (context, index) {
                    BaseModel data = mainList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Container(
                            width: size.width*0.6,
                            height: size.height * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              image: DecorationImage(
                                image: AssetImage(
                                  data.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(data.name,style: theme.bodySmall,),
                          ),
                          RichText(
                          text: TextSpan(
                            text: "€",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: [
                              TextSpan(
                                text: data.price.toString(),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
