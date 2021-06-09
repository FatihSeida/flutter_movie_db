class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };
}
