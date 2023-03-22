class Ticket {
    Ticket({
        this.id,
        this.userId,
        this.type,
        this.sponsorPackgeId,
        this.ticketId,
        this.spaceId,
        this.total,
        this.totalPrice,
        this.vatPercent,
        this.vatAmount,
        this.appPercent,
        this.addressId,
        this.appTotal,
        this.discount,
        this.deliveryCost,
        this.discountCode,
        this.subTotal,
        this.countItems,
        this.fcmToken,
        this.name,
        this.email,
        this.orderedDate,
        this.paymentId,
        this.paymentJson,
        this.paymentMethod,
        this.paymentStatus,
        this.status,
        this.createdAt,
        this.statusName,
    });

    int id;
    int userId;
    String type;
    int sponsorPackgeId;
    int ticketId;
    int spaceId;
    int total;
    int totalPrice;
    int vatPercent;
    int vatAmount;
    int appPercent;
    int addressId;
    int appTotal;
    int discount;
    int deliveryCost;
    String discountCode;
    int subTotal;
    int countItems;
    dynamic fcmToken;
    String name;
    String email;
    dynamic orderedDate;
    String paymentId;
    String paymentJson;
    String paymentMethod;
    String paymentStatus;
    int status;
    DateTime createdAt;
    String statusName;

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        sponsorPackgeId: json["sponsor_packge_id"],
        ticketId: json["ticket_id"],
        spaceId: json["space_id"],
        total: json["total"],
        totalPrice: json["total_price"],
        vatPercent: json["vat_percent"],
        vatAmount: json["vat_amount"],
        appPercent: json["app_percent"],
        addressId: json["address_id"],
        appTotal: json["app_total"],
        discount: json["discount"],
        deliveryCost: json["delivery_cost"],
        discountCode: json["discount_code"],
        subTotal: json["sub_total"],
        countItems: json["count_items"],
        fcmToken: json["fcm_token"],
        name: json["name"],
        email: json["email"],
        orderedDate: json["ordered_date"],
        paymentId: json["payment_id"] == null ? null : json["payment_id"],
        paymentJson: json["payment_json"] == null ? null : json["payment_json"],
        paymentMethod: json["payment_method"],
        paymentStatus: json["payment_status"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        statusName: json["status_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "sponsor_packge_id": sponsorPackgeId,
        "ticket_id": ticketId,
        "space_id": spaceId,
        "total": total,
        "total_price": totalPrice,
        "vat_percent": vatPercent,
        "vat_amount": vatAmount,
        "app_percent": appPercent,
        "address_id": addressId,
        "app_total": appTotal,
        "discount": discount,
        "delivery_cost": deliveryCost,
        "discount_code": discountCode,
        "sub_total": subTotal,
        "count_items": countItems,
        "fcm_token": fcmToken,
        "name": name,
        "email": email,
        "ordered_date": orderedDate,
        "payment_id": paymentId == null ? null : paymentId,
        "payment_json": paymentJson == null ? null : paymentJson,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "status_name": statusName,
    };
}
