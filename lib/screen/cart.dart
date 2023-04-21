import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:trendy_fashion/data/app_data.dart';
import 'package:trendy_fashion/main_wrapper.dart';
import 'package:trendy_fashion/model/base_model.dart';
import 'package:trendy_fashion/widgets/reusable_button.dart';
import 'package:trendy_fashion/widgets/reusable_card_row.dart';

import '../utils/constants.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
   //Calcolate the total price


  //Delete current list
  void onDelete(BaseModel data) {
    setState(() {
      if (itemsOnCart.length == 1) {
        itemsOnCart.clear();
      } else {
        itemsOnCart.removeWhere((element) => element.id == data.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child: itemsOnCart.isNotEmpty
                  ? ListView.builder(
                      itemCount: itemsOnCart.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var current = itemsOnCart[index];
                        return FadeInUp(
                          delay: Duration(milliseconds: 100 * index + 80),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: size.width,
                            height: size.height * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        current.imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Color.fromARGB(61, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.52,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              current.name,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                onDelete(current);
                                              },
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "€",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                          children: [
                                            TextSpan(
                                              text: current.price.toString(),
                                              style:
                                                  textTheme.bodyLarge?.copyWith(
                                                color: primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      Text(
                                        'Size=${sizes[3]}',
                                        style: textTheme.bodyLarge?.copyWith(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: size.height * 0.022,
                                        ),
                                        width: size.width * 0.4,
                                        height: size.height * 0.04,
                                        //  color: Colors.blue,

                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(4),
                                              width: size.width * 0.065,
                                              height: size.height * 0.045,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                onTap: () {
                                                  setState(() {
                                                    if (current.value > 1) {
                                                      current.value--;
                                                    } else {
                                                      onDelete(current);
                                                      current.value = 1;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      size.width * 0.02),
                                              child: Text(
                                                current.value.toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.all(4),
                                              width: size.width * 0.065,
                                              height: size.height * 0.045,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                onTap: () {
                                                  setState(() {
                                                    current.value > 0
                                                        ? current.value++
                                                        : null;
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 16,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        FadeInUp(
                          delay:  Duration(milliseconds: 100),
                          child: const Image(
                            image: AssetImage('assets/images/empty.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 250),
                          child: const Text(
                            'your cart is empty right now :(',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FadeInUp(
                          delay: Duration(milliseconds: 300),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainWrapper(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      FadeInUp(
                        delay: const Duration(
                          milliseconds: 350,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Promo/Student Code or vourches',
                              style: textTheme.displayLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: ReusableCartRow(text: 'Sub tutol', price: 140),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: ReusableCartRow(text: 'Shopping', price: 150),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: ReusableCartRow(text: 'Total', price: 550),
                      ),
                      FadeInUp(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: ReusableButton(
                            text: 'CheckOut',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cart(),
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
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        'My Cart',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.red,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            LineIcons.user,
            color: Colors.black,
          ),
        ),
      ],
      // toolbarHeight: 200,
      // flexibleSpace: Image.network(
      //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUxnBYaqBn7KAeK8nHxJ82AT1kGYp9nk9Lig&usqp=CAU',
      // ),
    );
  }
}
