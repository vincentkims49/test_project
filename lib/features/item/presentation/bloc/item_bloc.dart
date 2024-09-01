import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';
import 'package:test_project/features/item/domain/usecases/get_items.dart';
import 'package:test_project/features/item/domain/usecases/add_item.dart';
import 'package:test_project/features/item/domain/usecases/delete_item.dart';
import 'package:test_project/core/error/failure.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/item_model.dart';
import '../../domain/usecases/update_items.dart';

// Events
abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetItemsEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  final ItemModel item;

  const AddItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class UpdateItemEvent extends ItemEvent {
  final ItemEntity item;

  const UpdateItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class DeleteItemEvent extends ItemEvent {
  final int id;

  const DeleteItemEvent(this.id);

  @override
  List<Object> get props => [id];
}

// States
abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<ItemEntity> items;

  const ItemLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class ItemError extends ItemState {
  final String message;

  const ItemError(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final GetItems getItems;
  final AddItem addItem;
  final UpdateItem updateItem;
  final DeleteItem deleteItem;

  ItemBloc({
    required this.getItems,
    required this.addItem,
    required this.updateItem,
    required this.deleteItem,
  }) : super(ItemInitial()) {
    on<GetItemsEvent>(_onGetItems);
    on<AddItemEvent>(_onAddItem);
    on<UpdateItemEvent>(_onUpdateItem);
    on<DeleteItemEvent>(_onDeleteItem);
  }

  Future<void> _onGetItems(GetItemsEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    final failureOrItems = await getItems(NoParams());
    failureOrItems.fold(
      (failure) => emit(ItemError(_mapFailureToMessage(failure))),
      (items) => emit(ItemLoaded(items)),
    );
  }

  Future<void> _onAddItem(AddItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoading());

    // Print the item details before processing
    if (kDebugMode) {
      print(
          'Adding Item from bloc: ${event.item.title}, ${event.item.description}');
    }

    final failureOrSuccess = await addItem(event.item);
    failureOrSuccess.fold(
      (failure) {
        if (kDebugMode) {
          print('Add Item Error: $failure');
        }
        emit(ItemError(_mapFailureToMessage(failure)));
      },
      (_) {
        if (kDebugMode) {
          print('Item added successfully');
        }
        add(GetItemsEvent()); // Reload items
      },
    );
  }

  Future<void> _onUpdateItem(
      UpdateItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    final failureOrSuccess = await updateItem(event.item);
    failureOrSuccess.fold(
      (failure) => emit(ItemError(_mapFailureToMessage(failure))),
      (_) => add(GetItemsEvent()),
    );
  }

  Future<void> _onDeleteItem(
      DeleteItemEvent event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    final failureOrSuccess = await deleteItem(event.id);
    failureOrSuccess.fold(
      (failure) => emit(ItemError(_mapFailureToMessage(failure))),
      (_) => add(GetItemsEvent()),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is DatabaseFailure) {
      return AppStrings.databaseFailureMessage;
    }
    return 'Unexpected Error';
  }
}
