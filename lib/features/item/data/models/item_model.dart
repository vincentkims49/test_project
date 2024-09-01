import 'package:test_project/features/item/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel(
      {required super.id, required super.title, required super.description});

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}
