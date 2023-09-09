class Translatioin {
  final String turkmen;
  final String english;
  final String italian;
  final int id;

  Translatioin({
    required this.turkmen,
    required this.english,
    required this.italian,
    required this.id,
  });

  factory Translatioin.fromJson(Map<String, dynamic> json) {
    return Translatioin(
      turkmen: json['turkmen'],
      english: json['english'],
      italian: json['italian'],
      id: json['id'],
    );
  }
}
