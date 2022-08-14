import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventorymanagement/models/custom_error.dart';
import 'package:inventorymanagement/models/items.dart';
import 'package:inventorymanagement/repository/ItemRepository.dart';

part 'item_cubit_state.dart';

class ItemCubitCubit extends Cubit<ItemCubitState> {
  final ItemRepository itemRepository;
  ItemCubitCubit({required this.itemRepository})
  
      : super(ItemCubitState.initial());

  // Future<void> getItem() async {
  //   emit(state.copyWith(itemStatus: ItemStatus.loading));
  //   try {
  //     final Items item = await itemRepository.getItem();
  //     emit(state.copyWith(itemStatus: ItemStatus.loaded, item: item));
  //   } on CustomError catch (e) {
  //     emit(state.copyWith(error: e, itemStatus: ItemStatus.error));
  //   }
  // }

  
}
