class Todo {
  late final int id;
  late String name;
  late bool done;

  Todo.fromJson(Map json)
      : id = json["id"],
        name = json["name"],
        done = json["done"] || false;
}
