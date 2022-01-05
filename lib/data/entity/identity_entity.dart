/// tip : "<font style='font-size:30'>请绑定持卡人为<a href='https://github.com' style='text-decoration:none;color:#BFA253'>会员本人</a>的<strong>储蓄卡</strong></font>"
/// forms : [{"getID":"name","type":"intro","title":"姓名","value":"吴*","showQuestion":false},{"getID":"id","type":"intro","title":"身份证","value":"3101********111X","showQuestion":false},{"getID":"phone","type":"intro","title":"手机号","value":"185******29","showQuestion":false}]

class IdentityEntity {
  IdentityEntity({
    String? tip,
    List<Forms>? forms,
  }) {
    _tip = tip;
    _forms = forms;
  }

  IdentityEntity.fromJson(dynamic json) {
    _tip = json['tip'];
    if (json['forms'] != null) {
      _forms = [];
      json['forms'].forEach((v) {
        _forms?.add(Forms.fromJson(v));
      });
    }
  }

  String? _tip;
  List<Forms>? _forms;

  String? get tip => _tip;

  List<Forms>? get forms => _forms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tip'] = _tip;
    if (_forms != null) {
      map['forms'] = _forms?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// getID : "name"
/// type : "intro"
/// title : "姓名"
/// value : "吴*"
/// showQuestion : false

class Forms {
  Forms({
    String? getID,
    String? type,
    String? title,
    String? value,
    bool? showQuestion,
  }) {
    _getID = getID;
    _type = type;
    _title = title;
    _value = value;
    _showQuestion = showQuestion;
  }

  Forms.fromJson(dynamic json) {
    _getID = json['getID'];
    _type = json['type'];
    _title = json['title'];
    _value = json['value'];
    _showQuestion = json['showQuestion'];
  }

  String? _getID;
  String? _type;
  String? _title;
  String? _value;
  bool? _showQuestion;

  String? get getID => _getID;

  String? get type => _type;

  String? get title => _title;

  String? get value => _value;

  bool? get showQuestion => _showQuestion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['getID'] = _getID;
    map['type'] = _type;
    map['title'] = _title;
    map['value'] = _value;
    map['showQuestion'] = _showQuestion;
    return map;
  }
}
