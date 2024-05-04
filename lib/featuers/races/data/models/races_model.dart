// To parse this JSON data, do
//
//     final savingTripResponseModel = savingTripResponseModelFromJson(jsonString);

import 'dart:convert';

List<RacesResponseModel> racesResponseModelFromJson(String str) => List<RacesResponseModel>.from(json.decode(str).map((x) => RacesResponseModel.fromJson(x)));


class RacesResponseModel {
  String? name;
  String? organizer;
  String? date;
  String? country;
  String? city;
  String? image;
  String? type;
  String? distances;

  RacesResponseModel({
    this.name,
    this.organizer,
    this.date,
    this.country,
    this.city,
    this.image,
    this.type,
    this.distances,
  });

  factory RacesResponseModel.fromJson(Map<String, dynamic> json) => RacesResponseModel(
    name: json["name"],
    organizer: json["organizer"],
    date: json["date"],
    country: json["country"],
    city: json["city"],
    image: json["image"],
    type: json["type"],
    distances: json["distances"],
  );


}
