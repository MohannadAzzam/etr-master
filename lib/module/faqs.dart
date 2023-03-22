// To parse this JSON data, do
//
//     final faqs = faqsFromJson(jsonString);

import 'dart:convert';

Faqs faqsFromJson(String str) => Faqs.fromJson(json.decode(str));

String faqsToJson(Faqs data) => json.encode(data.toJson());

class Faqs {
    Faqs({
        this.id,
        this.status,
        this.createdAt,
        this.question,
        this.answer,
    });

    int id;
    String status;
    DateTime createdAt;
    String question;
    String answer;

    factory Faqs.fromJson(Map<String, dynamic> json) => Faqs(
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        question: json["question"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "question": question,
        "answer": answer,
    };
}
