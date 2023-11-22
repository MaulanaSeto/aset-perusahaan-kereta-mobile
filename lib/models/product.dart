import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String type;
    String name;
    String owner;
    int amount;
    DateTime dateAdded;
    String description;

    Fields({
        required this.user,
        required this.type,
        required this.name,
        required this.owner,
        required this.amount,
        required this.dateAdded,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        type: json["type"],
        name: json["name"],
        owner: json["owner"],
        amount: json["amount"],
        dateAdded: DateTime.parse(json["date_added"]),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "type": type,
        "name": name,
        "owner": owner,
        "amount": amount,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "description": description,
    };
}