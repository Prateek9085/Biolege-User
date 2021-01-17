// To parse this JSON data, do
//
//     final diagnosticCustomer = diagnosticCustomerFromJson(jsonString);

import 'dart:convert';

DiagnosticCustomer diagnosticCustomerFromJson(String str) =>
    DiagnosticCustomer.fromJson(json.decode(str));

String diagnosticCustomerToJson(DiagnosticCustomer data) =>
    json.encode(data.toJson());

class DiagnosticCustomer {
  DiagnosticCustomer({
    this.address,
    this.role,
    this.id,
    this.name,
    this.phoneNumber,
    this.gender,
    this.dob,
    this.bloodGroup,
    this.clinics,
    this.doctors,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Address address;
  dynamic role;
  String id;
  String name;
  int phoneNumber;
  String gender;
  DateTime dob;
  String bloodGroup;
  List<ObjectWithID> clinics;
  List<DoctorObj> doctors;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DiagnosticCustomer.fromJson(Map<String, dynamic> json) =>
      DiagnosticCustomer(
        address: Address.fromJson(json["address"]),
        role: json["role"],
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        bloodGroup: json["bloodGroup"],
        clinics: List<ObjectWithID>.from(
            json["clinics"].map((x) => ObjectWithID.fromJson(x))),
        doctors: List<DoctorObj>.from(
            json["doctors"].map((x) => DoctorObj.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "role": role,
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "dob": dob.toIso8601String(),
        "bloodGroup": bloodGroup,
        "clinics": List<dynamic>.from(clinics.map((x) => x.toJson())),
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Address {
  Address({
    this.state,
    this.city,
    this.pincode,
    this.homeAddress,
  });

  String state;
  String city;
  int pincode;
  String homeAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        homeAddress: json["homeAddress"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "city": city,
        "pincode": pincode,
        "homeAddress": homeAddress,
      };
}

class DoctorObj {
  DoctorObj({
    this.visitingDate,
    this.id,
    this.doctor,
  });

  List<DateTime> visitingDate;
  String id;
  ObjectWithID doctor;

  factory DoctorObj.fromJson(Map<String, dynamic> json) => DoctorObj(
        visitingDate: List<DateTime>.from(
            json["visitingDate"].map((x) => DateTime.parse(x))),
        id: json["_id"],
        doctor: ObjectWithID.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "visitingDate":
            List<dynamic>.from(visitingDate.map((x) => x.toIso8601String())),
        "_id": id,
        "doctor": doctor.toJson(),
      };
}

class ObjectWithID {
  ObjectWithID({
    this.id,
  });

  String id;

  factory ObjectWithID.fromJson(Map<String, dynamic> json) => ObjectWithID(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
