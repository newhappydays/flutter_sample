import 'package:hive/hive.dart';

part 'hive_todo.g.dart';

@HiveType(typeId: 0)
class HiveTodo extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool done;

  HiveTodo({
    required this.id,
    required this.title,
    required this.done,
  });
}
