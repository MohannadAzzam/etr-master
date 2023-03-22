import 'dart:convert';

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));

String settingsToJson(Settings data) => json.encode(data.toJson());

class Settings {
    Settings({
        this.id,
        this.url,
        this.logo,
        this.ticketPrice,
        this.spacePrice,
        this.taxAmount,
        this.appPercent,
        this.pointsInMony,
        this.monyInPoints,
        this.appStoreUrl,
        this.playStoreUrl,
        this.infoEmail,
        this.mobile,
        this.phone,
        this.paginate,
        this.facebook,
        this.twitter,
        this.linkedIn,
        this.instagram,
        this.tikTok,
        this.minOrder,
        this.fromHour,
        this.toHour,
        this.latitude,
        this.longitude,
        this.youtube,
        this.image,
        this.expoMap,
        this.expoMapPdf,
        this.isMaintenanceMode,
        this.isAlowedLogin,
        this.isAlowedRegister,
        this.isAlowedBuying,
        this.isAlowedCart,
        this.cancelOrderTime,
        this.deliveryCostPerKm,
        this.productDistance,
        this.homeVedioImage,
        this.homeVedioLink,
        this.createdAt,
        this.updatedAt,
        this.seoInBody,
        this.seoInHeader,
        this.pages,
        this.countries,
        this.title,
        this.description,
        this.address,
    });

    int id;
    String url;
    String logo;
    int ticketPrice;
    int spacePrice;
    int taxAmount;
    int appPercent;
    int pointsInMony;
    int monyInPoints;
    String appStoreUrl;
    String playStoreUrl;
    String infoEmail;
    String mobile;
    String phone;
    int paginate;
    String facebook;
    String twitter;
    String linkedIn;
    String instagram;
    String tikTok;
    int minOrder;
    String fromHour;
    String toHour;
    String latitude;
    String longitude;
    String youtube;
    String image;
    String expoMap;
    String expoMapPdf;
    int isMaintenanceMode;
    int isAlowedLogin;
    int isAlowedRegister;
    int isAlowedBuying;
    int isAlowedCart;
    int cancelOrderTime;
    int deliveryCostPerKm;
    int productDistance;
    String homeVedioImage;
    String homeVedioLink;
    dynamic createdAt;
    DateTime updatedAt;
    String seoInBody;
    String seoInHeader;
    List<Page> pages;
    List<Country> countries;
    String title;
    String description;
    String address;

    factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        id: json["id"],
        url: json["url"],
        logo: json["logo"],
        ticketPrice: json["ticket_price"],
        spacePrice: json["space_price"],
        taxAmount: json["tax_amount"],
        appPercent: json["app_percent"],
        pointsInMony: json["points_in_mony"],
        monyInPoints: json["mony_in_points"],
        appStoreUrl: json["app_store_url"],
        playStoreUrl: json["play_store_url"],
        infoEmail: json["info_email"],
        mobile: json["mobile"],
        phone: json["phone"],
        paginate: json["paginate"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        linkedIn: json["linked_in"],
        instagram: json["instagram"],
        tikTok: json["tik_tok"],
        minOrder: json["min_order"],
        fromHour: json["from_hour"],
        toHour: json["to_hour"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        youtube: json["youtube"],
        image: json["image"],
        expoMap: json["expo_map"],
        expoMapPdf: json["expo_map_pdf"],
        isMaintenanceMode: json["is_maintenance_mode"],
        isAlowedLogin: json["is_alowed_login"],
        isAlowedRegister: json["is_alowed_register"],
        isAlowedBuying: json["is_alowed_buying"],
        isAlowedCart: json["is_alowed_cart"],
        cancelOrderTime: json["cancel_order_time"],
        deliveryCostPerKm: json["delivery_cost_per_km"],
        productDistance: json["product_distance"],
        homeVedioImage: json["home_vedio_image"],
        homeVedioLink: json["home_vedio_link"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        seoInBody: json["seo_in_body"],
        seoInHeader: json["seo_in_header"],
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
        title: json["title"],
        description: json["description"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "logo": logo,
        "ticket_price": ticketPrice,
        "space_price": spacePrice,
        "tax_amount": taxAmount,
        "app_percent": appPercent,
        "points_in_mony": pointsInMony,
        "mony_in_points": monyInPoints,
        "app_store_url": appStoreUrl,
        "play_store_url": playStoreUrl,
        "info_email": infoEmail,
        "mobile": mobile,
        "phone": phone,
        "paginate": paginate,
        "facebook": facebook,
        "twitter": twitter,
        "linked_in": linkedIn,
        "instagram": instagram,
        "tik_tok": tikTok,
        "min_order": minOrder,
        "from_hour": fromHour,
        "to_hour": toHour,
        "latitude": latitude,
        "longitude": longitude,
        "youtube": youtube,
        "image": image,
        "expo_map": expoMap,
        "expo_map_pdf": expoMapPdf,
        "is_maintenance_mode": isMaintenanceMode,
        "is_alowed_login": isAlowedLogin,
        "is_alowed_register": isAlowedRegister,
        "is_alowed_buying": isAlowedBuying,
        "is_alowed_cart": isAlowedCart,
        "cancel_order_time": cancelOrderTime,
        "delivery_cost_per_km": deliveryCostPerKm,
        "product_distance": productDistance,
        "home_vedio_image": homeVedioImage,
        "home_vedio_link": homeVedioLink,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "seo_in_body": seoInBody,
        "seo_in_header": seoInHeader,
        "pages": List<dynamic>.from(pages.map((x) => x.toJson())),
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "title": title,
        "description": description,
        "address": address,
    };
}

class Country {
    Country({
        this.id,
        this.image,
        this.alpha3,
        this.status,
        this.createdAt,
        this.name,
    });

    int id;
    String image;
    String alpha3;
    Status status;
    DateTime createdAt;
    String name;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        image: json["image"],
        alpha3: json["alpha_3"],
        status: statusValues.map[json["status"]],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "alpha_3": alpha3,
        "status": statusValues.reverse[status],
        "created_at": createdAt.toIso8601String(),
        "name": name,
    };
}

enum Status { ACTIVE, NOT_ACTIVE }

final statusValues = EnumValues({
    "active": Status.ACTIVE,
    "not_active": Status.NOT_ACTIVE
});

class Page {
    Page({
        this.id,
        this.slug,
        this.image,
        this.views,
        this.createdAt,
        this.title,
        this.description,
        this.keyWords,
        this.firstDescription,
        this.subTitle,
        this.subTitle2,
        this.subTitle3,
        this.secondeDescription,
    });

    int id;
    dynamic slug;
    String image;
    int views;
    DateTime createdAt;
    String title;
    String description;
    dynamic keyWords;
    String firstDescription;
    String subTitle;
    String subTitle2;
    String subTitle3;
    String secondeDescription;

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        id: json["id"],
        slug: json["slug"],
        image: json["image"],
        views: json["views"],
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        description: json["description"],
        keyWords: json["key_words"],
        firstDescription: json["first_description"] == null ? null : json["first_description"],
        subTitle: json["sub_title"] == null ? null : json["sub_title"],
        subTitle2: json["sub_title_2"],
        subTitle3: json["sub_title_3"],
        secondeDescription: json["seconde_description"] == null ? null : json["seconde_description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "image": image,
        "views": views,
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "description": description,
        "key_words": keyWords,
        "first_description": firstDescription == null ? null : firstDescription,
        "sub_title": subTitle == null ? null : subTitle,
        "sub_title_2": subTitle2,
        "sub_title_3": subTitle3,
        "seconde_description": secondeDescription == null ? null : secondeDescription,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
