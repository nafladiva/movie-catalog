import 'package:equatable/equatable.dart';

class GenreMdl extends Equatable {
  const GenreMdl({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory GenreMdl.fromMap(Map<String, dynamic> json) => GenreMdl(
        id: json["id"],
        name: json["name"],
      );

  @override
  List<Object?> get props => [id, name];
}
