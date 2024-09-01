import 'package:dartz/dartz.dart';
import 'package:test_project/features/item/domain/repositories/item_repository.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';
import 'package:test_project/core/error/failure.dart';

import '../../../../core/usecases/usecases.dart';

class UpdateItem implements UseCase<void, ItemEntity> {
  final ItemRepository repository;

  UpdateItem(this.repository);

  @override
  Future<Either<Failure, void>> call(ItemEntity item) async {
    return await repository.updateItem(item);
  }
}
