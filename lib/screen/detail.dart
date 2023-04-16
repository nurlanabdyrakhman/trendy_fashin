import 'package:flutter/material.dart';
import 'package:trendy_fashion/model/base_model.dart';
import 'package:trendy_fashion/utils/constants.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/reusable_text.dart';

class Details extends StatefulWidget {
  Details({
    super.key,
    required this.data,
    required this.iscameFromMostPopularPart,
  });
  final BaseModel data;
  final bool iscameFromMostPopularPart;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    BaseModel current = widget.data;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: widget.iscameFromMostPopularPart
                        ? current.imageUrl
                        : current.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(current.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            current.name,
                            style: textTheme.bodySmall?.copyWith(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          ReUsableTextForDetals(
                            text: current.price.toString(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                current.star.toString(),
                                style: textTheme.bodySmall,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${current.review} K+ review',
                                style: textTheme.headlineMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.grey,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  'Select Size',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.08,
              color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                return AnimatedContainer(
                  margin: const EdgeInsets.all(10),
                  duration: const Duration(milliseconds: 200),
               width: size.width*0.12,
               decoration: BoxDecoration(
                color: Colors.pink
               ),
                );
              },),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
