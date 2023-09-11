import 'package:hive/hive.dart';
part 'translation.g.dart';

@HiveType(typeId: 1)
class Translatioin {
  @HiveField(0)
  final String turkmen;
  @HiveField(1)
  final String english;
  @HiveField(2)
  final String italian;
  @HiveField(3)
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
