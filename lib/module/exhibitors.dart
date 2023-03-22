// To parse this JSON data, do
//
//     final exhibitors = exhibitorsFromJson(jsonString);

import 'dart:convert';

Exhibitors exhibitorsFromJson(String str) => Exhibitors.fromJson(json.decode(str));

String exhibitorsToJson(Exhibitors data) => json.encode(data.toJson());

class Exhibitors {
    Exhibitors({
        this.id,
        this.image,
        this.video,
        this.status,
        this.exhibitions,
        this.name,
        this.shortDetails,
        this.details,
        this.pageName,
        this.pageDetails,
    });

    int id;
    String image;
    String video;
    String status;
    List<Exhibition> exhibitions;
    String name;
    String shortDetails;
    String details;
    String pageName;
    String pageDetails;

    factory Exhibitors.fromJson(Map<String, dynamic> json) => Exhibitors(
        id: json["id"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        exhibitions: List<Exhibition>.from(json["exhibitions"].map((x) => Exhibition.fromJson(x))),
        name: json["name"],
        shortDetails: json["short_details"],
        details: json["details"],
        pageName: json["page_name"],
        pageDetails: json["page_details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "video": video,
        "status": status,
        "exhibitions": List<dynamic>.from(exhibitions.map((x) => x.toJson())),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "page_name": pageName,
        "page_details": pageDetails,
    };
}


class Exhibition {
    Exhibition({
        this.id,
        this.type,
        this.sponsorPackgeId,
        this.spaceId,
        this.name,
        this.email,
        this.mobile,
        this.countryId,
        this.details,
        this.companyName,
        this.facebook,
        this.twitter,
        this.inesta,
        this.linkedin,
        this.bankAccount,
        this.iban,
        this.commercialRegisterId,
        this.startSubscription,
        this.endSubscription,
        this.platformPercent,
        this.address,
        this.cityName,
        this.notes,
        this.image,
        this.coverImage,
        this.rememberToken,
        this.status,
        this.verified,
        this.emailNotifications,
        this.space,
    });

    int id;
    int type;
    dynamic sponsorPackgeId;
    int spaceId;
    String name;
    String email;
    String mobile;
    int countryId;
    String details;
    String companyName;
    dynamic facebook;
    dynamic twitter;
    dynamic inesta;
    dynamic linkedin;
    dynamic bankAccount;
    dynamic iban;
    dynamic commercialRegisterId;
    dynamic startSubscription;
    dynamic endSubscription;
    dynamic platformPercent;
    dynamic address;
    dynamic cityName;
    dynamic notes;
    String image;
    String coverImage;
    dynamic rememberToken;
    String status;
    int verified;
    int emailNotifications;
    Space space;

    factory Exhibition.fromJson(Map<String, dynamic> json) => Exhibition(
        id: json["id"],
        type: json["type"],
        sponsorPackgeId: json["sponsor_packge_id"],
        spaceId: json["space_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        countryId: json["country_id"],
        details: json["details"],
        companyName: json["company_name"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        inesta: json["inesta"],
        linkedin: json["linkedin"],
        bankAccount: json["bank_account"],
        iban: json["iban"],
        commercialRegisterId: json["commercial_register_id"],
        startSubscription: json["start_subscription"],
        endSubscription: json["end_subscription"],
        platformPercent: json["platform_percent"],
        address: json["address"],
        cityName: json["city_name"],
        notes: json["notes"],
        image: json["image"],
        coverImage: json["cover_image"],
        rememberToken: json["remember_token"],
        status: json["status"],
        verified: json["verified"],
        emailNotifications: json["email_notifications"],
        space: Space.fromJson(json["space"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "sponsor_packge_id": sponsorPackgeId,
        "space_id": spaceId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "country_id": countryId,
        "details": details,
        "company_name": companyName,
        "facebook": facebook,
        "twitter": twitter,
        "inesta": inesta,
        "linkedin": linkedin,
        "bank_account": bankAccount,
        "iban": iban,
        "commercial_register_id": commercialRegisterId,
        "start_subscription": startSubscription,
        "end_subscription": endSubscription,
        "platform_percent": platformPercent,
        "address": address,
        "city_name": cityName,
        "notes": notes,
        "image": image,
        "cover_image": coverImage,
        "remember_token": rememberToken,
        "status": status,
        "verified": verified,
        "email_notifications": emailNotifications,
        "space": space.toJson(),
    };
}

class Space {
    Space({
        this.id,
        this.spaceNumber,
        this.spaceX,
        this.spaceY,
        this.disabled,
        this.image,
        this.video,
        this.status,
        this.createdAt,
        this.name,
        this.shortDetails,
        this.details,
        this.translations,
    });

    int id;
    int spaceNumber;
    int spaceX;
    int spaceY;
    int disabled;
    String image;
    String video;
    String status;
    DateTime createdAt;
    dynamic name;
    dynamic shortDetails;
    dynamic details;
    List<dynamic> translations;

    factory Space.fromJson(Map<String, dynamic> json) => Space(
        id: json["id"],
        spaceNumber: json["space_number"],
        spaceX: json["space_x"],
        spaceY: json["space_y"],
        disabled: json["disabled"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        shortDetails: json["short_details"],
        details: json["details"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "space_number": spaceNumber,
        "space_x": spaceX,
        "space_y": spaceY,
        "disabled": disabled,
        "image": image,
        "video": video,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "translations": List<dynamic>.from(translations.map((x) => x)),
    };
}

