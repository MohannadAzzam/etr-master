// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:etr/module/exhibitors.dart';
import 'package:etr/module/sponsors.dart';
import 'package:etr/module/ticket.dart';
import 'package:etr/module/tickets.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
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
        this.country_name,
        this.verified,
        this.emailNotifications,
        this.accessToken,
        this.tickets,
        this.space,
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
    String country_name;
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
    String accessToken;
    List<dynamic> tickets;
    List<dynamic> space;
    List<SponsorPackge> sponsorPackge;
    factory User.fromJson(Map<String, dynamic> json) => User(
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
        country_name: json["country_name"],
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
        accessToken: json["access_token"],
        tickets:json["tickets"]==null? []: List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
        space:json["space"]==null? []:  List<Space>.from(json["space"].map((x) => Space.fromJson(x))),
        sponsorPackge: json["sponsorPackge"]==null? []: List<SponsorPackge>.from(json["sponsorPackge"].map((x) => SponsorPackge.fromJson(x))),
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
        "country_name": country_name,
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
        "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
        "space": List<dynamic>.from(space.map((x) => x.toJson())),
        "sponsorPackge": List<dynamic>.from(sponsorPackge.map((x) => x.toJson())),
        "access_token": accessToken,
    };
}
