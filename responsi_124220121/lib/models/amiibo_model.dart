class Amiibo {
  final String name;
  final String gameSeries;
  final String imageUrl;
  final Map<String, dynamic> details;

  Amiibo(
      {required this.name,
      required this.gameSeries,
      required this.imageUrl,
      required this.details});

  factory Amiibo.fromJson(Map<String, dynamic> json) {
    return Amiibo(
      name: json['name'],
      gameSeries: json['gameSeries'],
      imageUrl: json['image'],
      details: json,
    );
  }
}
