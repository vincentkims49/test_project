import 'package:test_project/features/item/domain/repositories/item_repository.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';
import 'package:test_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';

class GetItems implements UseCase<List<ItemEntity>, NoParams> {
  final ItemRepository repository;

  GetItems(this.repository);

  @override
  Future<Either<Failure, List<ItemEntity>>> call(NoParams params) async {
    return await repository.getItems();
  }
}
