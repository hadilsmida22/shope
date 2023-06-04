import 'package:ecommerce_int2/models/product.dart';
import 'package:flutter/material.dart';
class CartModel extends ChangeNotifier {

//list of items on sale
final List _shopItems =[
['assets/icons/tomate.png', '', 'tomate', '', ''],
['assets/icons/ail.png', '', 'ail', '', ''],

];

//list of cart items
List _carteItems =[];
get CartItem => _carteItems;
get shopItems => _shopItems;

//add item to cart
void addItemToCart(int index){
  _carteItems.add(_shopItems[index]);
  notifyListeners();
}

//remove item from cart
void removeItemFromCart(int index){
  _carteItems.removeAt(index);
  notifyListeners();
}

//calculate total
String calculatetotal(){
  double totalPrice =0;
  for(int i =0;i <_carteItems.length ; i++){
    totalPrice += double.parse(_carteItems[i][4]);
  }
  return totalPrice.toStringAsFixed(2);
}
}