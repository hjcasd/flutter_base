/// data : {"admin":false,"coinCount":2517,"collectIds":[17532,17529,17461],"email":"","icon":"","id":16639,"nickname":"hjcasd","password":"","publicName":"hjcasd","token":"","type":0,"username":"hjcasd"}
/// errorCode : 0
/// errorMsg : ""

class LoginEntity {
  LoginEntity({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  LoginEntity.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Data? data;
  int? errorCode;
  String? errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['errorCode'] = errorCode;
    map['errorMsg'] = errorMsg;
    return map;
  }
}

/// admin : false
/// coinCount : 2517
/// collectIds : [17532,17529,17461]
/// email : ""
/// icon : ""
/// id : 16639
/// nickname : "hjcasd"
/// password : ""
/// publicName : "hjcasd"
/// token : ""
/// type : 0
/// username : "hjcasd"

class Data {
  Data({
    this.admin,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  });

  Data.fromJson(dynamic json) {
    admin = json['admin'];
    coinCount = json['coinCount'];
    collectIds = json['collectIds'] != null ? json['collectIds'].cast<int>() : [];
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    nickname = json['nickname'];
    password = json['password'];
    publicName = json['publicName'];
    token = json['token'];
    type = json['type'];
    username = json['username'];
  }

  bool? admin;
  int? coinCount;
  List<int>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = admin;
    map['coinCount'] = coinCount;
    map['collectIds'] = collectIds;
    map['email'] = email;
    map['icon'] = icon;
    map['id'] = id;
    map['nickname'] = nickname;
    map['password'] = password;
    map['publicName'] = publicName;
    map['token'] = token;
    map['type'] = type;
    map['username'] = username;
    return map;
  }
}
