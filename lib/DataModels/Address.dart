class Address {
  String street;
  String suite;
  String city;
  String zipCode;

  Address(
      {
        this.street,
        this.suite,
        this.city,
        this.zipCode,
      });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String ?? '',
      suite: json['suite'] as String?? '',
      city: json['city'] as String?? '',
      zipCode: json['zipcode'] as String?? '',


    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'street': street,
      'suite': suite ?? '',
      'city': city,
      'zipcode': zipCode,
    };
  }


}
