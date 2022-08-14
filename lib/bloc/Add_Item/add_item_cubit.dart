import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventorymanagement/models/custom_error.dart';
import 'package:inventorymanagement/models/items.dart';
import 'package:inventorymanagement/repository/ItemRepository.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  final ItemRepository itemRepository;

  AddItemCubit({required this.itemRepository}) : super(AddItemState.initial());

  Future<void> submitItem(
      {required String name,
      required int price,
      required int quantity,
      required int actualprice,
      required String category}) async {
    emit(state.copyWith(itemaddStatus: ItemaddStatus.submitting));
    try {
      await itemRepository.addItem(
        
          name: name,
          price: price,
          actualprice: actualprice,
          quantity: quantity,
          category: category);
    } on CustomError catch (e) {
      emit(state.copyWith(error: e, itemaddStatus: ItemaddStatus.error));
    }
  }
}
