// To parse this JSON data, do
//
//     final tickets = ticketsFromJson(jsonString);

import 'dart:convert';

Tickets ticketsFromJson(String str) => Tickets.fromJson(json.decode(str));

String ticketsToJson(Tickets data) => json.encode(data.toJson());

class Tickets {
    Tickets({
        this.id,
        this.image,
        this.video,
        this.status,
        this.events,
        this.name,
        this.shortDetails,
        this.details,
        this.pageName,
        this.pageDetails,
    });

    int id;
    String image;
    String video;
    Status status;
    List<TicketsEvent> events;
    String name;
    String shortDetails;
    String details;
    String pageName;
    String pageDetails;

    factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        id: json["id"],
        image: json["image"],
        video: json["video"],
        status: statusValues.map[json["status"]],
        events: List<TicketsEvent>.from(json["events"].map((x) => TicketsEvent.fromJson(x))),
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
        "status": statusValues.reverse[status],
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "name": name,
        "short_details": shortDetails,
        "details": details,
        "page_name": pageName,
        "page_details": pageDetails,
    };
}

class TicketsEvent {
    TicketsEvent({
        this.id,
        this.status,
        this.name,
        this.events,
    });

    int id;
    Status status;
    String name;
    List<EventEvent> events;

    factory TicketsEvent.fromJson(Map<String, dynamic> json) => TicketsEvent(
        id: json["id"],
        status: statusValues.map[json["status"]],
        name: json["name"],
        events: List<EventEvent>.from(json["events"].map((x) => EventEvent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": statusValues.reverse[status],
        "name": name,
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
    };
}

class EventEvent {
    EventEvent({
        this.id,
        this.dayId,
        this.time,
        this.image,
        this.status,
        this.name,
        this.details,
    });

    int id;
    int dayId;
    String time;
    String image;
    Status status;
    String name;
    String details;

    factory EventEvent.fromJson(Map<String, dynamic> json) => EventEvent(
        id: json["id"],
        dayId: json["day_id"],
        time: json["time"],
        image: json["image"],
        status: statusValues.map[json["status"]],
        name: json["name"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "day_id": dayId,
        "time": time,
        "image": image,
        "status": statusValues.reverse[status],
        "name": name,
        "details": details,
    };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
    "active": Status.ACTIVE
});

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
