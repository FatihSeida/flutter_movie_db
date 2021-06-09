class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  int id;
  String logoPath;
  String name;
  String originCountry;

  factory ProductionCompany.fromMap(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json['id'],
        logoPath: json['logo_path'] ?? '',
        name: json['name'],
        originCountry: json['origin_country'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };
}
