import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventorymanagement/bloc/Add_Item/add_item_cubit.dart';
import 'package:inventorymanagement/bloc/Item_cubit/item_cubit_cubit.dart';
import 'package:inventorymanagement/screens/addItems.dart';

import 'package:inventorymanagement/screens/home.dart';
import 'package:inventorymanagement/repository/ItemRepository.dart';

const apiKey = "AIzaSyB7gI_vdagFFEtCZD01E4sqIK_l1ZhfPvE";
const projectId = "inventorymanagement-7c43d";

void main() async {
  WidgetsFlutterBinding?.ensureInitialized();

  Firestore.initialize(projectId);

//  await  DesktopWindow.getFullScreen();
  // await Supabase.initialize(
  //     url: 'https://evbkkpnqfnuqfphsartp.supabase.co',
  //     anonKey: 'public-anon-key');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return RepositoryProvider(
        create: (context) => ItemRepository(),
        child: MultiBlocProvider(
          child: MaterialApp(
              home: AddItems(
            height: height,
            width: width,
          )),
          providers: [
            BlocProvider<ItemCubitCubit>(
              create: (context) => ItemCubitCubit(
                itemRepository: context.read<ItemRepository>(),
              ),
            ),
            BlocProvider<AddItemCubit>(
                create: (context) => AddItemCubit(
                    itemRepository: context.read<ItemRepository>()))
          ],
        ));
  }
}
