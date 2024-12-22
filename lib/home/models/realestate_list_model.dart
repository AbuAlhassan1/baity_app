import 'dart:convert';

RealestateListModel realestateListModelFromJson(String str) => RealestateListModel.fromJson(json.decode(str));
String realestateListModelToJson(RealestateListModel data) => json.encode(data.toJson());

class RealestateListModel {
    final dynamic message;
    final bool? success;
    final List<RealestateItemModel>? payload;

    RealestateListModel({
        this.message,
        this.success,
        this.payload,
    });

    factory RealestateListModel.fromJson(Map<String, dynamic> json) => RealestateListModel(
        message: json["message"],
        success: json["success"],
        payload: json["payload"] == null ? [] : List<RealestateItemModel>.from(json["payload"]!.map((x) => RealestateItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class RealestateItemModel {
    final String? id;
    final DateTime? createdAt;
    final String? title;
    final String? ownerType;
    final String? ownerName;
    final String? ownerImageUrl;
    final String? offerType;
    final double? lat;
    final double? lng;
    final double? price;
    final double? area;
    final int? views;
    final int? imagesCount;
    final bool? hasVideo;
    final bool? isUrgent;
    final int? age;
    final dynamic noOfRooms;
    final int? noOfBedRooms;
    final int? noOfBathRooms;
    final int? noOfLivingRooms;
    final int? noOfFloors;
    final int? parkingCapacity;
    final String? image;
    final BuildingComplexGroup? buildingComplexGroup;
    final BuildingComplexGroup? country;
    final BuildingComplexGroup? city;
    final BuildingComplexGroup? district;
    final BuildingComplexGroup? subDistrict;
    final BuildingComplexGroup? category;
    final BuildingComplexGroup? subCategory;

    RealestateItemModel({
        this.id,
        this.createdAt,
        this.title,
        this.ownerType,
        this.ownerName,
        this.ownerImageUrl,
        this.offerType,
        this.lat,
        this.lng,
        this.price,
        this.area,
        this.views,
        this.imagesCount,
        this.hasVideo,
        this.isUrgent,
        this.age,
        this.noOfRooms,
        this.noOfBedRooms,
        this.noOfBathRooms,
        this.noOfLivingRooms,
        this.noOfFloors,
        this.parkingCapacity,
        this.image,
        this.buildingComplexGroup,
        this.country,
        this.city,
        this.district,
        this.subDistrict,
        this.category,
        this.subCategory,
    });

    factory RealestateItemModel.fromJson(Map<String, dynamic> json) => RealestateItemModel(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        title: json["title"],
        ownerType: json["ownerType"],
        ownerName: json["ownerName"],
        ownerImageUrl: json["ownerImageUrl"],
        offerType: json["offerType"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        price: json["price"]?.toDouble(),
        area: json["area"]?.toDouble(),
        views: json["views"],
        imagesCount: json["imagesCount"],
        hasVideo: json["hasVideo"],
        isUrgent: json["isUrgent"],
        age: json["age"],
        noOfRooms: json["noOfRooms"],
        noOfBedRooms: json["noOfBedRooms"],
        noOfBathRooms: json["noOfBathRooms"],
        noOfLivingRooms: json["noOfLivingRooms"],
        noOfFloors: json["noOfFloors"],
        parkingCapacity: json["parkingCapacity"],
        image: json["image"],
        buildingComplexGroup: json["buildingComplexGroup"] == null ? null : BuildingComplexGroup.fromJson(json["buildingComplexGroup"]),
        country: json["country"] == null ? null : BuildingComplexGroup.fromJson(json["country"]),
        city: json["city"] == null ? null : BuildingComplexGroup.fromJson(json["city"]),
        district: json["district"] == null ? null : BuildingComplexGroup.fromJson(json["district"]),
        subDistrict: json["subDistrict"] == null ? null : BuildingComplexGroup.fromJson(json["subDistrict"]),
        category: json["category"] == null ? null : BuildingComplexGroup.fromJson(json["category"]),
        subCategory: json["subCategory"] == null ? null : BuildingComplexGroup.fromJson(json["subCategory"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "title": title,
        "ownerType": ownerType,
        "ownerName": ownerName,
        "ownerImageUrl": ownerImageUrl,
        "offerType": offerType,
        "lat": lat,
        "lng": lng,
        "price": price,
        "area": area,
        "views": views,
        "imagesCount": imagesCount,
        "hasVideo": hasVideo,
        "isUrgent": isUrgent,
        "age": age,
        "noOfRooms": noOfRooms,
        "noOfBedRooms": noOfBedRooms,
        "noOfBathRooms": noOfBathRooms,
        "noOfLivingRooms": noOfLivingRooms,
        "noOfFloors": noOfFloors,
        "parkingCapacity": parkingCapacity,
        "image": image,
        "buildingComplexGroup": buildingComplexGroup?.toJson(),
        "country": country?.toJson(),
        "city": city?.toJson(),
        "district": district?.toJson(),
        "subDistrict": subDistrict?.toJson(),
        "category": category?.toJson(),
        "subCategory": subCategory?.toJson(),
    };
}

class BuildingComplexGroup {
    final String? id;
    final String? name;

    BuildingComplexGroup({
        this.id,
        this.name,
    });

    factory BuildingComplexGroup.fromJson(Map<String, dynamic> json) => BuildingComplexGroup(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}