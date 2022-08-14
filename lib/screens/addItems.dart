import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagement/bloc/Add_Item/add_item_cubit.dart';
import 'package:inventorymanagement/bloc/Item_cubit/item_cubit_cubit.dart';
import 'package:inventorymanagement/models/items.dart';
import 'package:inventorymanagement/repository/ItemRepository.dart';
import 'package:inventorymanagement/screens/itemList.dart';
import 'package:inventorymanagement/utils/error_dialog.dart';
import 'package:http/http.dart' as http;

class AddItems extends StatefulWidget {
  final double height;
  final double width;
  AddItems({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  ItemRepository i = new ItemRepository();
  String? name, category;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  int? quantity, price, actualPrice;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddItemCubit, AddItemState>(listener: (context, state) {
      if (state.itemaddStatus == ItemaddStatus.error) {
        print('error in Adding the value');
        errorDialog(context, state.error);
      }
    }, builder: (context, state) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
          key: _form,
          child: ListView(children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Name', prefixIcon: Icon(Icons.add_box_rounded)),
              onChanged: (value) {
                name = value;
              },
              validator: (String? value) {
                if (value!.length < 0 || value.trim().isEmpty) {
                  return "Name is required";
                }
                if (value.trim().length < 2) {
                  return "Name must be  greater than 2 letters";
                }
              },
            ),
            TextFormField(
              onChanged: ((value) {
                price = int.parse(value);
              }),
              decoration: const InputDecoration(
                labelText: "Price",
              ),
              validator: (String? value) {
                if (value!.length < 0 || value.trim().isEmpty) {
                  return "Price is required";
                }
                if (value.trim().length < 1) {
                  return "Price must be greater than one letter";
                }
              },
            ),
            TextFormField(
              onChanged: ((value) {
                actualPrice = int.parse(value);
              }),
              decoration: const InputDecoration(
                labelText: "Actual_Price",
              ),
              validator: (String? value) {
                if (value!.length < 0 || value.trim().isEmpty) {
                  return "Actual Price is required";
                }
                if (value.trim().length < 1) {
                  return "Actual Price must be greater than one letter";
                }
              },
            ),
            TextFormField(
              onChanged: ((value) {
                quantity = int.parse(value);
              }),
              decoration: const InputDecoration(
                labelText: "Quantity",
              ),
              validator: (String? value) {
                if (value!.length < 0 || value.trim().isEmpty) {
                  return "Quantity is required";
                }
                if (value.trim().length < 1) {
                  return "Quantity must be greater than one letter";
                }
              },
            ),
            TextFormField(
              onChanged: ((value) {
                category = value;
              }),
              decoration: const InputDecoration(
                labelText: "Category",
              ),
              validator: (String? value) {
                if (value!.length < 0 || value.trim().isEmpty) {
                  return "Category is required";
                }
                if (value.trim().length < 2) {
                  return "Category must be greater than one letter";
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                  final formstate = _form.currentState;
                  formstate?.validate();
                  formstate?.save();

                  context.read<AddItemCubit>().submitItem(
                      name: name!,
                      price: price!,
                      quantity: quantity!,
                      actualprice: actualPrice!,
                      category: category!);
                },
                child: Text('Submit')),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemList()));
                },
                child: Text("Get Items"))
          ]),
        ),
   
      );
    });
  }
}
