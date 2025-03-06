class Outlet {
  final String url;
  final String type;

  Outlet({
    required this.url,
    required this.type,
  });

  factory Outlet.fromJson(Map<String, dynamic> json) {
    return Outlet(
      url: json['url'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'type': type,
    };
  }
  
  // Optional aliases
  factory Outlet.fromMap(Map<String, dynamic> map) => Outlet.fromJson(map);
  Map<String, dynamic> toMap() => toJson();
}