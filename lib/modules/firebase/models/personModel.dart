class PersonModel {
  String documentID;
  String name;
  int age;

  PersonModel({this.name, this.age});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      age: json['age']
    );
  }

  toJson() {
    return {
      "name": name,
      "age": age,
    };
  }
}