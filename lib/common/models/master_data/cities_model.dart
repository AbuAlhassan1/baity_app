// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

import 'package:baity_app/common/models/item_model.dart';

CitiesModel citiesModelFromJson(String str) => CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
    final dynamic message;
    final bool? success;
    final List<CityItemModel>? payload;

    CitiesModel({
        this.message,
        this.success,
        this.payload,
    });

    factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        message: json["message"],
        success: json["success"],
        payload: json["payload"] == null ? [] : List<CityItemModel>.from(json["payload"]!.map((x) => CityItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class CityItemModel extends ItemModel {
    final Names? names;
    final Stats? stats;
    final bool? isActive;
    final bool? isDeleted;
    final dynamic namee;
    final String? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final double? lat;
    final double? lng;
    final int? zoom;
    final List<List<double>>? polygon;
    final Country? country;

    CityItemModel({
        this.names,
        this.stats,
        this.isActive,
        this.isDeleted,
        this.namee,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.lat,
        this.lng,
        this.zoom,
        this.polygon,
        this.country,
    }){
      super.name = namee??names!.arIq;
    }

    factory CityItemModel.fromJson(Map<String, dynamic> json) => CityItemModel(
        names: json["names"] == null ? null : Names.fromJson(json["names"]),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        namee: json["namee"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        zoom: json["zoom"],
        polygon: json["polygon"] == null ? [] : List<List<double>>.from(json["polygon"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "names": names?.toJson(),
        "stats": stats?.toJson(),
        "isActive": isActive,
        "isDeleted": isDeleted,
        "namee": namee,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "lat": lat,
        "lng": lng,
        "zoom": zoom,
        "polygon": polygon == null ? [] : List<dynamic>.from(polygon!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "country": country?.toJson(),
    };
}

class Country {
    final Id? id;
    final Name? name;

    Country({
        this.id,
        this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: idValues.map[json["id"]],
        name: nameValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
    };
}

enum Id {
    G76_HDC
}

final idValues = EnumValues({
    "G76HDC": Id.G76_HDC
});

enum Name {
    IRAQ
}

final nameValues = EnumValues({
    "Iraq": Name.IRAQ
});

class Names {
    final String? enUs;
    final String? arIq;
    final String? kuIq;

    Names({
        this.enUs,
        this.arIq,
        this.kuIq,
    });

    factory Names.fromJson(Map<String, dynamic> json) => Names(
        enUs: json["en-US"],
        arIq: json["ar-IQ"],
        kuIq: json["ku-IQ"],
    );

    Map<String, dynamic> toJson() => {
        "en-US": enUs,
        "ar-IQ": arIq,
        "ku-IQ": kuIq,
    };
}

class Stats {
    final int? districts;
    final int? subDistricts;
    final RealestateGroup? realestateGroup;
    final Realestates? realestates;

    Stats({
        this.districts,
        this.subDistricts,
        this.realestateGroup,
        this.realestates,
    });

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        districts: json["districts"],
        subDistricts: json["subDistricts"],
        realestateGroup: json["realestateGroup"] == null ? null : RealestateGroup.fromJson(json["realestateGroup"]),
        realestates: json["realestates"] == null ? null : Realestates.fromJson(json["realestates"]),
    );

    Map<String, dynamic> toJson() => {
        "districts": districts,
        "subDistricts": subDistricts,
        "realestateGroup": realestateGroup?.toJson(),
        "realestates": realestates?.toJson(),
    };
}

class RealestateGroup {
    final int? realestateAgency;
    final int? buildingComplex;
    final int? constructionCompany;
    final int? realestateDeveloper;
    final int? realtor;
    final int? customer;

    RealestateGroup({
        this.realestateAgency,
        this.buildingComplex,
        this.constructionCompany,
        this.realestateDeveloper,
        this.realtor,
        this.customer,
    });

    factory RealestateGroup.fromJson(Map<String, dynamic> json) => RealestateGroup(
        realestateAgency: json["realestateAgency"],
        buildingComplex: json["buildingComplex"],
        constructionCompany: json["constructionCompany"],
        realestateDeveloper: json["realestateDeveloper"],
        realtor: json["realtor"],
        customer: json["customer"],
    );

    Map<String, dynamic> toJson() => {
        "realestateAgency": realestateAgency,
        "buildingComplex": buildingComplex,
        "constructionCompany": constructionCompany,
        "realestateDeveloper": realestateDeveloper,
        "realtor": realtor,
        "customer": customer,
    };
}

class Realestates {
    final int? total;
    final int? urgent;
    final OfferType? offerType;
    final RealestateGroup? ownerType;

    Realestates({
        this.total,
        this.urgent,
        this.offerType,
        this.ownerType,
    });

    factory Realestates.fromJson(Map<String, dynamic> json) => Realestates(
        total: json["total"],
        urgent: json["urgent"],
        offerType: json["offerType"] == null ? null : OfferType.fromJson(json["offerType"]),
        ownerType: json["ownerType"] == null ? null : RealestateGroup.fromJson(json["ownerType"]),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "urgent": urgent,
        "offerType": offerType?.toJson(),
        "ownerType": ownerType?.toJson(),
    };
}

class OfferType {
    final int? sell;
    final int? rent;
    final int? unknown;

    OfferType({
        this.sell,
        this.rent,
        this.unknown,
    });

    factory OfferType.fromJson(Map<String, dynamic> json) => OfferType(
        sell: json["sell"],
        rent: json["rent"],
        unknown: json["unknown"],
    );

    Map<String, dynamic> toJson() => {
        "sell": sell,
        "rent": rent,
        "unknown": unknown,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
