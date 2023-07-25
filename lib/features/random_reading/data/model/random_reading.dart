final class RandomReading {
  final String reading;

  RandomReading({required this.reading});

  factory RandomReading.fromJson(Map<String, dynamic> json) {
    return RandomReading(reading: json['reading'] ?? "");
  }
}
