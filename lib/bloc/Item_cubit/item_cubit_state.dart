part of 'item_cubit_cubit.dart';

enum ItemStatus {
  initial,
  loading,
  loaded,
  error;
}


class ItemCubitState extends Equatable {
  final Items item;
  final ItemStatus itemStatus;
  final CustomError error;

  ItemCubitState(
      {required this.item, required this.itemStatus, required this.error});

  factory ItemCubitState.initial() {
    return ItemCubitState(
        item: Items.initial(),
        error: CustomError(),
        itemStatus: ItemStatus.initial);
  }

  ItemCubitState copyWith({
    Items? item,
    ItemStatus? itemStatus,
    CustomError? error,
  }) {
    return ItemCubitState(
      item: item ?? this.item,
      itemStatus: itemStatus ?? this.itemStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'ItemCubitState(item: $item, itemStatus: $itemStatus, error: $error)';

  @override
  List<Object> get props => [item, itemStatus, error];
}
