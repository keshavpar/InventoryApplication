part of 'add_item_cubit.dart';

enum ItemaddStatus { initial, submitting, submitted, error }

class AddItemState extends Equatable {
  final ItemaddStatus itemaddStatus;
  final Items items;
  final CustomError error;

  AddItemState(
      {required this.itemaddStatus, required this.items, required this.error});

  factory AddItemState.initial() {
    return AddItemState(
        itemaddStatus: ItemaddStatus.initial,
        items: Items.initial(),
        error: CustomError());
  }

  @override
  String toString() =>
      'AddItemState(itemaddStatus: $itemaddStatus, items: $items, error: $error)';

  @override
  List<Object> get props => [itemaddStatus, items, error];

  AddItemState copyWith({
    Items? items,
    ItemaddStatus? itemaddStatus,
    CustomError? error,
  }) {
    return AddItemState(
      itemaddStatus: itemaddStatus ?? this.itemaddStatus,
      items: items ?? this.items,
      error: error ?? this.error,
    );
  }
}
