// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
        this.categores,
        this.supportTeams,
        this.blogs,
    });

    List<Categore> categores;
    List<SupportTeam> supportTeams;
    List<Blog> blogs;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        categores: List<Categore>.from(json["categores"].map((x) => Categore.fromJson(x))),
        supportTeams: List<SupportTeam>.from(json["supportTeams"].map((x) => SupportTeam.fromJson(x))),
        blogs: List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categores": List<dynamic>.from(categores.map((x) => x.toJson())),
        "supportTeams": List<dynamic>.from(supportTeams.map((x) => x.toJson())),
        "blogs": List<dynamic>.from(blogs.map((x) => x.toJson())),
    };
}

class Blog {
    Blog({
        this.id,
        this.userId,
        this.categoryId,
        this.viewCount,
        this.image,
        this.status,
        this.name,
        this.shortDetails,
        this.details,
        this.author,
        this.createdAt,
    });

    int id;
    String userId;
    int categoryId;
    String viewCount;
    String image;
    String status;
    String name;
    String shortDetails;
    DateTime createdAt;
    String details;
    String author;

    factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        viewCount: json["view_count"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),

        name: json["name"],
        shortDetails: json["short_details"],
        details: json["details"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "view_count": viewCount,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "author": author,
    };
}

class Categore {
    Categore({
        this.id,
        this.image,
        this.video,
        this.status,
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
    String name;
    String shortDetails;
    String details;
    String pageName;
    String pageDetails;

    factory Categore.fromJson(Map<String, dynamic> json) => Categore(
        id: json["id"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        name: json["name"],
        shortDetails: json["short_details"],
        details: json["details"],
        pageName: json["page_name"],
        pageDetails: json["page_details"] == null ? null : json["page_details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "video": video,
        "status": status,
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "page_name": pageName,
        "page_details": pageDetails == null ? null : pageDetails,
    };
}

class SupportTeam {
    SupportTeam({
        this.id,
        this.email,
        this.mobile,
        this.image,
        this.status,
        this.name,
        this.position,
    });

    int id;
    String email;
    dynamic mobile;
    String image;
    String status;
    String name;
    String position;

    factory SupportTeam.fromJson(Map<String, dynamic> json) => SupportTeam(
        id: json["id"],
        email: json["email"],
        mobile: json["mobile"],
        image: json["image"],
        status: json["status"],
        name: json["name"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "mobile": mobile,
        "image": image,
        "status": status,
        "name": name,
        "position": position,
    };
}
