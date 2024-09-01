import 'package:test_project/features/item/domain/repositories/item_repository.dart';
import 'package:test_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';

class DeleteItem implements UseCase<void, int> {
  final ItemRepository repository;

  DeleteItem(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteItem(id);
  }
}
