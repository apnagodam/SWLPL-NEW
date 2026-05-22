// To parse this JSON data, do
//
//     final geocodingModel = geocodingModelFromMap(jsonString);

import 'dart:convert';

GeocodingModel geocodingModelFromMap(String str) =>
    GeocodingModel.fromMap(json.decode(str));

String geocodingModelToMap(GeocodingModel data) => json.encode(data.toMap());

class GeocodingModel {
  PlusCode? plusCode;
  List<Result>? results;
  String? status;

  GeocodingModel({
    this.plusCode,
    this.results,
    this.status,
  });

  factory GeocodingModel.fromMap(Map<String, dynamic> json) => GeocodingModel(
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromMap(json["plus_code"]),
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "plus_code": plusCode?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
        "status": status,
      };
}

class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  factory PlusCode.fromMap(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toMap() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}

class Result {
  List<AddressComponent>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
  PlusCode? plusCode;
  List<String>? types;

  Result({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.plusCode,
    this.types,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        addressComponents: json["address_components"] == null
            ? []
            : List<AddressComponent>.from(json["address_components"]!
                .map((x) => AddressComponent.fromMap(x))),
        formattedAddress: json["formatted_address"],
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromMap(json["geometry"]),
        placeId: json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromMap(json["plus_code"]),
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "address_components": addressComponents == null
            ? []
            : List<dynamic>.from(addressComponents!.map((x) => x.toMap())),
        "formatted_address": formattedAddress,
        "geometry": geometry?.toMap(),
        "place_id": placeId,
        "plus_code": plusCode?.toMap(),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}

class AddressComponent {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  factory AddressComponent.fromMap(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: json["types"] == null
            ? []
            : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "long_name": longName,
        "short_name": shortName,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}

class Geometry {
  Location? location;
  String? locationType;
  Bounds? viewport;
  Bounds? bounds;

  Geometry({
    this.location,
    this.locationType,
    this.viewport,
    this.bounds,
  });

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromMap(json["location"]),
        locationType: json["location_type"],
        viewport:
            json["viewport"] == null ? null : Bounds.fromMap(json["viewport"]),
        bounds: json["bounds"] == null ? null : Bounds.fromMap(json["bounds"]),
      );

  Map<String, dynamic> toMap() => {
        "location": location?.toMap(),
        "location_type": locationType,
        "viewport": viewport?.toMap(),
        "bounds": bounds?.toMap(),
      };
}

class Bounds {
  Location? northeast;
  Location? southwest;

  Bounds({
    this.northeast,
    this.southwest,
  });

  factory Bounds.fromMap(Map<String, dynamic> json) => Bounds(
        northeast: json["northeast"] == null
            ? null
            : Location.fromMap(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Location.fromMap(json["southwest"]),
      );

  Map<String, dynamic> toMap() => {
        "northeast": northeast?.toMap(),
        "southwest": southwest?.toMap(),
      };
}

class Location {
  double? lat;
  double? lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}
