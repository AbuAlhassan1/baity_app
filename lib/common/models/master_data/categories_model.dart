import 'dart:convert';

import 'package:baity_app/common/models/item_model.dart';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));
String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
    final dynamic message;
    final bool? success;
    final List<CategoryItemModel>? payload;

    CategoriesModel({
        this.message,
        this.success,
        this.payload,
    });

    factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        message: json["message"],
        success: json["success"],
        payload: json["payload"] == null ? [] : List<CategoryItemModel>.from(json["payload"]!.map((x) => CategoryItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class CategoryItemModel extends ItemModel {
    final String? id;
    final int? sortingIndex;
    final bool? isActive;
    final bool? isDeleted;
    final String? image;
    final List<dynamic>? types;
    final Names? names;
    final List<SubCategory>? subCategories;
    final Stats? stats;

    CategoryItemModel({
        this.id,
        this.sortingIndex,
        this.isActive,
        this.isDeleted,
        this.image,
        this.types,
        this.names,
        this.subCategories,
        this.stats,
    }){
      super.name = names!.arIq.toString();
    }

    factory CategoryItemModel.fromJson(Map<String, dynamic> json) => CategoryItemModel(
        id: json["id"],
        sortingIndex: json["sortingIndex"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        image: json["image"],
        types: json["types"] == null ? [] : List<dynamic>.from(json["types"]!.map((x) => x)),
        names: json["names"] == null ? null : Names.fromJson(json["names"]),
        subCategories: json["subCategories"] == null ? [] : List<SubCategory>.from(json["subCategories"]!.map((x) => SubCategory.fromJson(x))),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sortingIndex": sortingIndex,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "image": image,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "names": names?.toJson(),
        "subCategories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "stats": stats?.toJson(),
    };
}

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
    final Realestates? realestates;

    Stats({
        this.realestates,
    });

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        realestates: json["realestates"] == null ? null : Realestates.fromJson(json["realestates"]),
    );

    Map<String, dynamic> toJson() => {
        "realestates": realestates?.toJson(),
    };
}

class Realestates {
    final int? total;
    final int? urgent;
    final OfferType? offerType;
    final OwnerType? ownerType;

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
        ownerType: json["ownerType"] == null ? null : OwnerType.fromJson(json["ownerType"]),
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

class OwnerType {
    final int? realestateAgency;
    final int? constructionCompany;
    final int? realestateDeveloper;
    final int? realtor;
    final int? customer;
    final int? buildingComplex;

    OwnerType({
        this.realestateAgency,
        this.constructionCompany,
        this.realestateDeveloper,
        this.realtor,
        this.customer,
        this.buildingComplex,
    });

    factory OwnerType.fromJson(Map<String, dynamic> json) => OwnerType(
        realestateAgency: json["realestateAgency"],
        constructionCompany: json["constructionCompany"],
        realestateDeveloper: json["realestateDeveloper"],
        realtor: json["realtor"],
        customer: json["customer"],
        buildingComplex: json["buildingComplex"],
    );

    Map<String, dynamic> toJson() => {
        "realestateAgency": realestateAgency,
        "constructionCompany": constructionCompany,
        "realestateDeveloper": realestateDeveloper,
        "realtor": realtor,
        "customer": customer,
        "buildingComplex": buildingComplex,
    };
}

class SubCategory {
    final String? id;
    final int? sortingIndex;
    final bool? isActive;
    final bool? isDeleted;
    final String? image;
    final Names? names;
    final Category? category;
    final dynamic stats;
    final List<String>? realestateFeatures;
    final List<String>? features;

    SubCategory({
        this.id,
        this.sortingIndex,
        this.isActive,
        this.isDeleted,
        this.image,
        this.names,
        this.category,
        this.stats,
        this.realestateFeatures,
        this.features,
    });

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        sortingIndex: json["sortingIndex"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        image: json["image"],
        names: json["names"] == null ? null : Names.fromJson(json["names"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        stats: json["stats"],
        realestateFeatures: json["realestateFeatures"] == null ? [] : List<String>.from(json["realestateFeatures"]!.map((x) => x)),
        features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sortingIndex": sortingIndex,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "image": image,
        "names": names?.toJson(),
        "category": category?.toJson(),
        "stats": stats,
        "realestateFeatures": realestateFeatures == null ? [] : List<dynamic>.from(realestateFeatures!.map((x) => x)),
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
    };
}

class Category {
    final String? id;
    final String? name;

    Category({
        this.id,
        this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
