/// tip : "我们将使用您的会员信息用于开通东航钱包，请您仔细核对信息是否正确。"
/// title : "身份信息"
/// count : 1000
/// form : [{"id":"name","title":"姓名","value":"郑*","tip":"","operate":""},{"id":"idCard","title":"身份证","value":"3101********111X","tip":"","operate":""},{"id":"phone","title":"手机号","value":"185******29","tip":"手机号不正确","operate":"修改"}]
/// protocol : {"title":"阅读并同意","content":["《东航钱包服务协议》","《隐私协议》"]}
/// button : "确认并开通东航钱包"

class UserEntity {
  UserEntity({
    this.tip,
    this.title,
    this.count,
    this.form,
    this.protocol,
    this.button,
  });

  UserEntity.fromJson(dynamic json) {
    tip = json['tip'];
    title = json['title'];
    count = json['count'];
    if (json['form'] != null) {
      form = [];
      json['form'].forEach((v) {
        form?.add(Form.fromJson(v));
      });
    }
    protocol = json['protocol'] != null ? Protocol.fromJson(json['protocol']) : null;
    button = json['button'];
  }

  String? tip;
  String? title;
  int? count;
  List<Form>? form;
  Protocol? protocol;
  String? button;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tip'] = tip;
    map['title'] = title;
    map['count'] = count;
    if (form != null) {
      map['form'] = form?.map((v) => v.toJson()).toList();
    }
    if (protocol != null) {
      map['protocol'] = protocol?.toJson();
    }
    map['button'] = button;
    return map;
  }
}

/// title : "阅读并同意"
/// content : ["《东航钱包服务协议》","《隐私协议》"]

class Protocol {
  Protocol({
    this.title,
    this.content,
  });

  Protocol.fromJson(dynamic json) {
    title = json['title'];
    content = json['content'] != null ? json['content'].cast<String>() : [];
  }

  String? title;
  List<String>? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['content'] = content;
    return map;
  }
}

/// id : "name"
/// title : "姓名"
/// value : "郑*"
/// tip : ""
/// operate : ""

class Form {
  Form({
    this.id,
    this.title,
    this.value,
    this.tip,
    this.operate,
  });

  Form.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
    tip = json['tip'];
    operate = json['operate'];
  }

  String? id;
  String? title;
  String? value;
  String? tip;
  String? operate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['value'] = value;
    map['tip'] = tip;
    map['operate'] = operate;
    return map;
  }
}
