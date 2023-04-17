import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:trendy_fashion/widgets/reusable_card_row.dart';
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
            Container(
              width: size.width,
              height: size.height * 0.6,
              color: Colors.red,
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
                        delay: Duration(milliseconds: 350,),
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Promo/Student Code or vourches',
                              style:
                                  textTheme.displayLarge?.copyWith(fontSize: 16),
                            ),
                            const Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.01,),
                      ReusableCartRow(text: 'Sub tutol', price: 140)
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
      toolbarHeight: 200,
      flexibleSpace: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUxnBYaqBn7KAeK8nHxJ82AT1kGYp9nk9Lig&usqp=CAU',
      ),
    );
  }
}
