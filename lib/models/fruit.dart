class Fruit {
  int? id;
  String name;

  Fruit({this.id, required this.name});

  factory Fruit.fromJson(Map<String, dynamic> jsonFruit) =>
      Fruit(id: jsonFruit['id'], name: jsonFruit['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
