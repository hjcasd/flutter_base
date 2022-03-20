import 'dart:convert';
import 'package:flutter_base/generated/json/base/json_field.dart';
import 'package:flutter_base/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {

	String? tip;
	String? title;
	List<UserForm>? form;
	UserProtocol? protocol;
	String? button;
  
  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserForm {

	String? id;
	String? title;
	String? value;
	String? tip;
	String? operate;
  
  UserForm();

  factory UserForm.fromJson(Map<String, dynamic> json) => $UserFormFromJson(json);

  Map<String, dynamic> toJson() => $UserFormToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProtocol {

	String? title;
	List<String>? content;
  
  UserProtocol();

  factory UserProtocol.fromJson(Map<String, dynamic> json) => $UserProtocolFromJson(json);

  Map<String, dynamic> toJson() => $UserProtocolToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}