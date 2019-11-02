class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String?? '',
      catchPhrase: json['catchPhrase'] as String?? '',
      bs: json['bs'] as String?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase ?? '',
      'bs': bs,
    };
  }

}


