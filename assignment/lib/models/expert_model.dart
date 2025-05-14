class ExpertCardModel {
  final String name;
  final double rating;
  final int experienceYears;
  final double pricePerMin;
  final double? originalPrice;
  final bool isOnline;

  ExpertCardModel({
    required this.name,
    required this.rating,
    required this.experienceYears,
    required this.pricePerMin,
    this.originalPrice,
    required this.isOnline,
  });

  factory ExpertCardModel.fromJson(Map<String, dynamic> json) {
    return ExpertCardModel(
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      experienceYears: json['experienceYears'],
      pricePerMin: (json['pricePerMin'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null
          ? (json['originalPrice'] as num).toDouble()
          : null,
      isOnline: json['isOnline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rating': rating,
      'experienceYears': experienceYears,
      'pricePerMin': pricePerMin,
      'originalPrice': originalPrice,
      'isOnline': isOnline,
    };
  }
}
