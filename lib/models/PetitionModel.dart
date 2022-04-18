import 'dart:convert';

class PetitionModel {
  PetitionModel({
    required this.cellPhone,
    required this.name,
    required this.petition,
  });

  String cellPhone;
  String name;
  String petition;

  factory PetitionModel.fromJson(String str) =>
      PetitionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PetitionModel.fromMap(Map<String, dynamic> json) => PetitionModel(
        cellPhone: json["cellPhone"],
        name: json["name"],
        petition: json["petition"],
      );

  Map<String, dynamic> toMap() => {
        "cellPhone": cellPhone,
        "name": name,
        "petition": petition,
      };
}
