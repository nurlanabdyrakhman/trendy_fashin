

import 'package:flutter/material.dart';
import 'package:trendy_fashion/model/base_model.dart';
import 'package:advance_notification/advance_notification.dart';
import '../data/app_data.dart';

class AddToCart{
static void addToCart(BaseModel data,BuildContext context){
    bool contains=itemsOnCart.contains(data);
    if(contains==true){
   AdvanceSnackBar(
    textSize: 14,
    bgColor: Colors.red,
    message: 'you have added this item to cart vefore',
    mode: Mode.ADVANCE,
    duration: Duration(seconds: 5),
   ).show(context);
    }else{
      itemsOnCart.add(data);
   AdvanceSnackBar(

    textSize: 14,
   
    message: 'Successfully added to your cart',
    mode: Mode.ADVANCE,
    duration: Duration(seconds: 5),
   ).show(context);
    }
  }
}