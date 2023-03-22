// To parse this JSON data, do
//
//     final sponsors = sponsorsFromJson(jsonString);

import 'dart:convert';

Sponsors sponsorsFromJson(String str) => Sponsors.fromJson(json.decode(str));

String sponsorsToJson(Sponsors data) => json.encode(data.toJson());

class Sponsors {
    Sponsors({
        this.id,
        this.image,
        this.video,
        this.status,
        this.sponsors,
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
    List<Sponsor> sponsors;
    String name;
    String shortDetails;
    String details;
    String pageName;
    dynamic pageDetails;

    factory Sponsors.fromJson(Map<String, dynamic> json) => Sponsors(
        id: json["id"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        sponsors: List<Sponsor>.from(json["sponsors"].map((x) => Sponsor.fromJson(x))),
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
        "sponsors": List<dynamic>.from(sponsors.map((x) => x.toJson())),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "page_name": pageName,
        "page_details": pageDetails,
    };
}



class Sponsor {
    Sponsor({
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
        this.sponsorPackge,
    });

    int id;
    int type;
    int sponsorPackgeId;
    dynamic spaceId;
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
    SponsorPackge sponsorPackge;

    factory Sponsor.fromJson(Map<String, dynamic> json) => Sponsor(
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
        sponsorPackge: SponsorPackge.fromJson(json["sponsor_packge"]),
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
        "sponsor_packge": sponsorPackge.toJson(),
    };
}

class SponsorPackge {
    SponsorPackge({
        this.id,
        this.image,
        this.price,
        this.fullPrice,
        this.status,
        this.createdAt,
        this.name,
        this.shortDetails,
        this.details,
    });

    int id;
    String image;
    int price;
    int fullPrice;
    String status;
    DateTime createdAt;
    String name;
    String shortDetails;
    String details;

    factory SponsorPackge.fromJson(Map<String, dynamic> json) => SponsorPackge(
        id: json["id"],
        image: json["image"],
        price: json["price"],
        fullPrice: json["full_price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        shortDetails: json["short_details"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "price": price,
        "full_price": fullPrice,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "short_details": shortDetails,
        "details": details,
    };
}


