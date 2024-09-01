import 'package:sqflite/sqflite.dart';

import '../../../../core/database/database_helper.dart';
import '../models/item_model.dart';

abstract class ItemLocalDataSource {
  Future<List<ItemModel>> getItems();
  Future<void> addItem(ItemModel item);
  Future<void> updateItem(ItemModel item);
  Future<void> deleteItem(int id);
}

class ItemLocalDataSourceImpl implements ItemLocalDataSource {
  final DatabaseHelper databaseHelper;

  ItemLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<ItemModel>> getItems() async {
    final db = await databaseHelper.database;
    final maps = await db.query('items');

    if (maps.isNotEmpty) {
      return maps.map((map) => ItemModel.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addItem(ItemModel item) async {
    try {
      final db = await databaseHelper.database;

      await db.insert(
        'items',
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateItem(ItemModel item) async {
    final db = await databaseHelper.database;
    await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  @override
  Future<void> deleteItem(int id) async {
    final db = await databaseHelper.database;
    await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
