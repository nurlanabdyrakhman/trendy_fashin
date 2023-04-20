import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:trendy_fashion/model/base_model.dart';
import 'package:line_icons/line_icons.dart';
import 'package:trendy_fashion/screen/detail.dart';
import '../data/app_data.dart';
import '../medhud/add_to_cart.dart';
import '../utils/constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    itemsOnSearch = mainList;
  }

  onSearchFunc(String search) {
    setState(() {
      itemsOnSearch = mainList
          .where(
            (element) => element.name.toLowerCase().contains(search),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              //search TextField
              FadeInUp(
                delay: const Duration(milliseconds: 50),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: TextField(
                      controller: _controller,
                      onChanged: (value) => onSearchFunc(value),
                      style: textTheme.displaySmall?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _controller.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            );
                          },
                          icon: const Icon(Icons.close),
                        ),
                        hintStyle: textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        hintText: 'e.g Colins Jeans',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                child: itemsOnSearch.isNotEmpty
                    ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: itemsOnSearch.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.63, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          BaseModel current = itemsOnSearch[index];
                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index),
                            child: GestureDetector(
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
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: size.height * 0.02,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01,
                                    child: Hero(
                                      tag: current.id,
                                      child: Container(
                                        width: size.width * 0.5,
                                        height: size.height * 0.28,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
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
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.04,
                                    child: Text(
                                      current.name,
                                      style: textTheme.bodyMedium,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.01,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "€",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                        children: [
                                          TextSpan(
                                            text: current.price.toString(),
                                            style:
                                                textTheme.bodySmall?.copyWith(
                                              color: primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: size.height*0.01,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      child: IconButton(
                                        onPressed: () {
                                        AddToCart.addToCart(current,context);
                                        },
                                        icon: const Icon(LineIcons.addToShoppingCart),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInUp(
                            delay: const Duration(milliseconds: 200),
                            child: const Image(
                              image: AssetImage('assets/images/search.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          FadeInUp(
                            delay: const Duration(
                              milliseconds: 200,
                            ),
                            child: const Text(
                              'No Resuld Found:(',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
