class BUser {
  String request;
  String action;

  BUser(this.request, this.action);

  factory BUser.fromJson(dynamic json) {
    return BUser(json['request'] as String, json['action'] as String);
  }

  @override
  String toString() {
    return '{ ${this.request}, ${this.action} }';
  }
}