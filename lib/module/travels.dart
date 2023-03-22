// To parse this JSON data, do
//
//     final travels = travelsFromJson(jsonString);

import 'dart:convert';

Travels travelsFromJson(String str) => Travels.fromJson(json.decode(str));

String travelsToJson(Travels data) => json.encode(data.toJson());

class Travels {
    Travels({
        this.id,
        this.image,
        this.video,
        this.status,
        this.travels,
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
    List<Travel> travels;
    String name;
    String shortDetails;
    String details;
    String pageName;
    dynamic pageDetails;

    factory Travels.fromJson(Map<String, dynamic> json) => Travels(
        id: json["id"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        travels: List<Travel>.from(json["travels"].map((x) => Travel.fromJson(x))),
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
        "travels": List<dynamic>.from(travels.map((x) => x.toJson())),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "page_name": pageName,
        "page_details": pageDetails,
    };
}

class Travel {
    Travel({
        this.id,
        this.url,
        this.status,
        this.image,
        this.createdAt,
        this.name,
        this.shortDetails,
        this.details,
    });

    int id;
    String url;
    String status;
    String image;
    DateTime createdAt;
    String name;
    String shortDetails;
    String details;

    factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        id: json["id"],
        url: json["url"],
        status: json["status"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        shortDetails: json["short_details"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "status": status,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "short_details": shortDetails,
        "details": details,
    };
}
