import 'package:dartz/dartz.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';
import 'package:test_project/core/error/failure.dart';

import '../../data/models/item_model.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<ItemEntity>>> getItems();
  Future<Either<Failure, void>> addItem(ItemModel item);
  Future<Either<Failure, void>> updateItem(ItemEntity item);
  Future<Either<Failure, void>> deleteItem(int id);
}
