class WhoUse {
  final String name;
  bool isUse;
  setIsUse(bool isUse) {
    this.isUse = isUse;
  }

  factory WhoUse.fromJson(dynamic json) {
    return WhoUse(json['name'] as String, json['isUse'] as bool);
  }
  WhoUse(this.name, this.isUse);
}
