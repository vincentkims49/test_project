import 'package:test_project/features/item/data/datasources/item_local_data_source.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';
import 'package:test_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_project/features/item/domain/repositories/item_repository.dart';

import '../models/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource localDataSource;

  ItemRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<ItemEntity>>> getItems() async {
    try {
      final items = await localDataSource.getItems();
      return Right(items);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addItem(ItemModel item) async {
    try {
      await localDataSource.addItem(item);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateItem(ItemEntity item) async {
    try {
      await localDataSource.updateItem(item as ItemModel);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteItem(int id) async {
    try {
      await localDataSource.deleteItem(id); // Pass String id
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
