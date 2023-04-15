import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/model/categories_model.dart';
import 'package:trendy_fashion/screen/detail.dart';
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Find your',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 36),
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
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16),
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
                delay: const Duration(milliseconds: 450),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 7,
                  ),
                  width: size.width,
                  height: size.height * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      CategoriesModel current = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                        ),
                      );
                    },
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: size.width,
                  height: size.height * 0.45,
                  child: PageView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                data: mainList[index],
                                iscameFromMostPopularPart: false,
                              ),
                            ),
                          );
                        },
                        child: view(index, theme, size),
                      );
                    },
                  ),
                ),
              ),
              FadeInUp(
                  delay: const Duration(milliseconds: 650),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular',
                          style: theme.bodyMedium,
                        ),
                        Text(
                          'See all',
                          style: theme.bodyMedium,
                        )
                      ],
                    ),
                  )),
              FadeInUp(
                delay: const Duration(
                  milliseconds: 750,
                ),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.44,
                  //color: Colors.yellow,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.63, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      BaseModel current = mainList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                data: mainList[index],
                                iscameFromMostPopularPart: true,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Hero(
                              tag: current.imageUrl,
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.3,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(current.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Color.fromARGB(
                                          61,
                                          0,
                                          0,
                                          0,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Text(
                                current.name,
                                style: theme.bodyMedium,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "€",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: current.price.toString(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;
        if (_controller.position.haveDimensions) {
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.04).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.14 * value,
          child: _buildCard(size, mainList[index], theme),
        );
      },
    );
  }

  Padding _buildCard(Size size, BaseModel data, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.6,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              data.name,
              style: theme.bodySmall,
            ),
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
  }
}
