import 'dart:convert';

class OrderResponseModel {
  List<OrderResponse>? order;

  OrderResponseModel({this.order});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      order = [];
      json['user'].forEach((v) {
        var data = OrderResponse(
          id: v['Id'].toString(),
          state: v['State'].toString(),
          category: v['Category'].toString(),
          arrivalDate: v['ArrivalDate'].toString(),
          fullName: v['FullName'].toString(),
          cin: v['Cin'].toString(),
          company: v['Company'].toString(),
          registrationNumber: v['RegistrationNumber'].toString(),
          badgeNumber: v['BadgeNumber'].toString(),
          person: v['Person'].toString(),
          authorizedBy: v['AuthorizedBy'].toString(),
          firePermit: v['FirePermit'].toString(),
          email: v['Email'].toString(),
          releaseDate: v['ReleaseDate'].toString(),
          entryDate: v['EntryDate'].toString(),
          senderEmail: v['SenderEmail'].toString(),
        );
        order!.add(data);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['user'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderResponse {
  String id;
  String state;
  String category;
  String arrivalDate;
  String fullName;
  String cin;
  String company;
  String registrationNumber;
  String badgeNumber;
  String person;
  String authorizedBy;
  String firePermit;
  String email;
  String releaseDate;
  String entryDate;
  String senderEmail;

  OrderResponse(
      {required this.id,
      required this.state,
      required this.category,
      required this.arrivalDate,
      required this.fullName,
      required this.cin,
      required this.company,
      required this.registrationNumber,
      required this.badgeNumber,
      required this.person,
      required this.authorizedBy,
      required this.firePermit,
      required this.email,
      required this.releaseDate,
      required this.entryDate,
      required this.senderEmail});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['Id'],
      state: json['State'],
      category: json['Category'],
      arrivalDate: json['ArrivalDate'],
      fullName: json['FullName'],
      cin: json['Cin'],
      company: json['Company'],
      registrationNumber: json['RegistrationNumber'],
      badgeNumber: json['BadgeNumber'],
      person: json['Person'],
      authorizedBy: json['AuthorizedBy'],
      firePermit: json['FirePermit'],
      email: json['Email'],
      releaseDate: json['ReleaseDate'],
      entryDate: json['EntryDate'],
      senderEmail: json['SenderEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['State'] = this.state;
    data['Category'] = this.category;
    data['ArrivalDate'] = this.arrivalDate;
    data['FullName'] = this.fullName;
    data['Cin'] = this.cin;
    data['Company'] = this.company;
    data['RegistrationNumber'] = this.registrationNumber;
    data['BadgeNumber'] = this.badgeNumber;
    data['Person'] = this.person;
    data['AuthorizedBy'] = this.authorizedBy;
    data['FirePermit'] = this.firePermit;
    data['Email'] = this.email;
    data['ReleaseDate'] = this.releaseDate;
    data['EntryDate'] = this.entryDate;
    data['SenderEmail'] = this.senderEmail;
    return data;
  }
}
