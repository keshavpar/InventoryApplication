import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagement/bloc/Item_cubit/item_cubit_cubit.dart';
import 'package:inventorymanagement/models/Item.dart';
import 'package:inventorymanagement/models/items.dart';
import 'package:inventorymanagement/repository/ItemRepository.dart';
import 'package:inventorymanagement/utils/error_dialog.dart';

class ItemList extends StatefulWidget {
  ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Items>? items;
  List<Item>? item;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemCubitCubit, ItemCubitState>(
        listener: (context, state) {
      if (state.itemStatus == ItemStatus.error) {
        print("error in loading the items ");
        errorDialog(context, state.error);
      }
    }, builder: (context, state) {
      context.read<ItemCubitCubit>().itemRepository.getItem();
      return Scaffold(
          body: FutureBuilder<Item>(
              future:
                  (context.watch<ItemCubitCubit>().itemRepository.getItem()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [Text(snapshot.data!.data![index].name.toString())],);
                    },
                  );
                } else {
                  return Text("No Data");
                }
              }));
    });
  }
}
