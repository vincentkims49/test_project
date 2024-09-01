class ItemSchema {
  static const String tableName = 'items';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';

  static const String createTable = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitle TEXT NOT NULL,
      $columnDescription TEXT NOT NULL
    )
  ''';
}
