// To parse this JSON data, do
//
//     final organizers = organizersFromJson(jsonString);

import 'dart:convert';

Organizers organizersFromJson(String str) => Organizers.fromJson(json.decode(str));

String organizersToJson(Organizers data) => json.encode(data.toJson());

class Organizers {
    Organizers({
        this.id,
        this.image,
        this.video,
        this.status,
        this.organizers,
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
    List<Organizer> organizers;
    String name;
    String shortDetails;
    String details;
    String pageName;
    String pageDetails;

    factory Organizers.fromJson(Map<String, dynamic> json) => Organizers(
        id: json["id"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        organizers: List<Organizer>.from(json["organizers"].map((x) => Organizer.fromJson(x))),
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
        "organizers": List<dynamic>.from(organizers.map((x) => x.toJson())),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "page_name": pageName,
        "page_details": pageDetails,
    };
}

class Organizer {
    Organizer({
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
        this.countryName,
    });

    int id;
    int type;
    dynamic sponsorPackgeId;
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
    String countryName;

    factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
        id: json["id"],
        type: json["type"],
        sponsorPackgeId: json["sponsor_packge_id"],
        spaceId: json["space_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        countryId: json["country_id"],
        details: json["details"] == null ? null : json["details"],
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
        countryName: json["country_name"],
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
        "details": details == null ? null : details,
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
        "country_name": countryName,
    };
}
