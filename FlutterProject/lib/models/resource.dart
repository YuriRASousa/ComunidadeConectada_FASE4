class Resource {
  final String id;
  final String title;
  final String description;
  final String category;
  final String condition;
  final String offerantId;
  final String? imageUrl;
  final String availability;
  final String type;
  final double? latitude;
  final double? longitude;
  final String offerantName;

  Resource({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.condition,
    required this.offerantId,
    this.imageUrl,
    required this.availability,
    required this.type,
    this.latitude,
    this.longitude,
    this.offerantName = "Usuário",
  });
}
