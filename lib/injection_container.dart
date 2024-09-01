import 'package:get_it/get_it.dart';
import 'package:test_project/features/item/presentation/bloc/item_bloc.dart';
import 'package:test_project/features/item/domain/usecases/get_items.dart';
import 'package:test_project/features/item/data/repositories/item_repository_impl.dart';
import 'package:test_project/features/item/data/datasources/item_local_data_source.dart';
import 'package:test_project/core/database/database_helper.dart';

import 'features/item/domain/repositories/item_repository.dart';
import 'features/item/domain/usecases/add_item.dart';
import 'features/item/domain/usecases/delete_item.dart';
import 'features/item/domain/usecases/update_items.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Database
  sl.registerLazySingleton(() => DatabaseHelper());

  // Data sources
  sl.registerLazySingleton<ItemLocalDataSource>(
    () => ItemLocalDataSourceImpl(databaseHelper: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(localDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetItems(sl()));
  sl.registerLazySingleton(() => AddItem(sl()));
  sl.registerLazySingleton(() => UpdateItem(sl()));
  sl.registerLazySingleton(() => DeleteItem(sl()));

  // Blocs
  sl.registerFactory(
    () => ItemBloc(
        getItems: sl(), addItem: sl(), updateItem: sl(), deleteItem: sl()),
  );
}
