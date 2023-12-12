class User{
  int id;
  String email;
  String password_hash;
  String name;
  DateTime born_date;
  double height;
  double weight;
  DateTime createdAt;
  DateTime updateDate;

  User(this.id, this.email, this.password_hash, this.name, this.born_date, this.height, this.weight, this.createdAt, this.updateDate);
}

class UserForScreen{
  String id;
  String email;
  String password_hash;
  String name;
  String born_date;
  String height;
  String weight;
  String createdAt;
  String updateDate;

  UserForScreen(this.id, this.email, this.password_hash, this.name, this.born_date, this.height, this.weight, this.createdAt, this.updateDate);
}