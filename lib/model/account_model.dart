class Account {
  String? email;
  String? number;
  String? address;

  Account({this.number, this.email, this.address});

  Account.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        number = json['number'],
        address = json['address'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'number': number,
        'address': address,
      };
}
