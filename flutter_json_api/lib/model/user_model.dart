// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final int id;
    final String firstname;
    final String lastname;
    final String email;
    final DateTime birthDate;
    final Login login;
    final Address address;
    final String phone;
    final String website;
    final Company company;

    UserModel({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.birthDate,
        required this.login,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        birthDate: DateTime.parse(json["birthDate"]),
        login: Login.fromJson(json["login"]),
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "login": login.toJson(),
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
    };
}

class Address {
    final String street;
    final String suite;
    final String city;
    final String zipcode;
    final Geo geo;

    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
    };

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

class Geo {
    final String lat;
    final String lng;

    Geo({
        required this.lat,
        required this.lng,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    final String name;
    final String catchPhrase;
    final String bs;

    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}

class Login {
    final String uuid;
    final String username;
    final String password;
    final String md5;
    final String sha1;
    final DateTime registered;

    Login({
        required this.uuid,
        required this.username,
        required this.password,
        required this.md5,
        required this.sha1,
        required this.registered,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        md5: json["md5"],
        sha1: json["sha1"],
        registered: DateTime.parse(json["registered"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "md5": md5,
        "sha1": sha1,
        "registered": registered.toIso8601String(),
    };
}
