class Account {
  final String name;
  final String id;
  final String iconUrl;

  const Account({
    required this.name,
    required this.id,
    required this.iconUrl,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json['login'],
      id: json['id'].toString(),
      iconUrl: json['avatar_url'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'login': name,
      'id': id,
      'avatar_url': iconUrl,
    };
  }
}
