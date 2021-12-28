/// data : {"admin":false,"chapterTops":[],"coinCount":2517,"collectIds":[17532,17529,17461],"email":"","icon":"","id":16639,"nickname":"hjcasd","password":"","publicName":"hjcasd","token":"","type":0,"username":"hjcasd"}
/// errorCode : 0
/// errorMsg : ""

class LoginEntity {
  LoginInfo({
    Data? data,
    int? errorCode,
    String? errorMsg,
  }) {
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
  }

  LoginEntity.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  Data? _data;
  int? _errorCode;
  String? _errorMsg;

  Data? get data => _data;

  int? get errorCode => _errorCode;

  String? get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }
}

/// admin : false
/// chapterTops : []
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
    bool? admin,
    int? coinCount,
    List<int>? collectIds,
    String? email,
    String? icon,
    int? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    int? type,
    String? username,
  }) {
    _admin = admin;
    _coinCount = coinCount;
    _collectIds = collectIds;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
  }

  Data.fromJson(dynamic json) {
    _admin = json['admin'];
    _coinCount = json['coinCount'];
    _collectIds = json['collectIds'] != null ? json['collectIds'].cast<int>() : [];
    _email = json['email'];
    _icon = json['icon'];
    _id = json['id'];
    _nickname = json['nickname'];
    _password = json['password'];
    _publicName = json['publicName'];
    _token = json['token'];
    _type = json['type'];
    _username = json['username'];
  }

  bool? _admin;
  int? _coinCount;
  List<int>? _collectIds;
  String? _email;
  String? _icon;
  int? _id;
  String? _nickname;
  String? _password;
  String? _publicName;
  String? _token;
  int? _type;
  String? _username;

  bool? get admin => _admin;

  int? get coinCount => _coinCount;

  List<int>? get collectIds => _collectIds;

  String? get email => _email;

  String? get icon => _icon;

  int? get id => _id;

  String? get nickname => _nickname;

  String? get password => _password;

  String? get publicName => _publicName;

  String? get token => _token;

  int? get type => _type;

  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = _admin;
    map['coinCount'] = _coinCount;
    map['collectIds'] = _collectIds;
    map['email'] = _email;
    map['icon'] = _icon;
    map['id'] = _id;
    map['nickname'] = _nickname;
    map['password'] = _password;
    map['publicName'] = _publicName;
    map['token'] = _token;
    map['type'] = _type;
    map['username'] = _username;
    return map;
  }
}
