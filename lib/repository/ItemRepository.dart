import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventorymanagement/bloc/Item_cubit/item_cubit_cubit.dart';
import 'package:inventorymanagement/constants/constant.dart';
import 'package:inventorymanagement/models/Item.dart';
import 'package:inventorymanagement/models/custom_error.dart';
import 'package:inventorymanagement/models/items.dart';
import 'package:inventorymanagement/utils/error_dialog.dart';
import 'package:http/http.dart' as http;

class ItemRepository {


 //Posting the Item in  
  Future<void> addItem(
      {required String name,
      required int price,
      required int quantity,
      required int actualprice,
      required String category}) async {
    String url = "https://inventorymanagement45.herokuapp.com/create_item";

    // userItem.add

    http.Response response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
        body: json.encode({
          "name": name,
          "price": price.toInt(),
          "quantity": quantity.toInt(),
          "cost_price": actualprice.toInt(),
          "category": category
        }));
        
    if (response.statusCode == 200) {
      print(response.body.toString());
      print("Party dedo",);
    } else {
      print("Goo khalo");
    }
  }

//Get all the Items in the Inventory
  Future<Item> getItem() async {
    var baseurl = Uri.parse("https://inventorymanagement45.herokuapp.com/itemsList");
    var client = http.Client();
    var response = await client.get(baseurl);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      print(json);
      return Item.fromJson(json);
    } else {
      return Item.fromJson(json);
    }
  }
}
