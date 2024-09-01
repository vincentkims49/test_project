import 'package:test_project/features/item/domain/repositories/item_repository.dart';
import 'package:test_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../../data/models/item_model.dart';

class AddItem implements UseCase<void, ItemModel> {
  final ItemRepository repository;

  AddItem(this.repository);

  @override
  Future<Either<Failure, void>> call(ItemModel item) async {
    final result = await repository.addItem(item);

    return result;
  }
}
