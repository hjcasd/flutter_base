import 'package:flutter_base/generated/json/base/json_convert_content.dart';
import 'package:flutter_base/data/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? tip = jsonConvert.convert<String>(json['tip']);
	if (tip != null) {
		userEntity.tip = tip;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		userEntity.title = title;
	}
	final int? count = jsonConvert.convert<int>(json['count']);
	if (count != null) {
		userEntity.count = count;
	}
	final List<UserForm>? form = jsonConvert.convertListNotNull<UserForm>(json['form']);
	if (form != null) {
		userEntity.form = form;
	}
	final UserProtocol? protocol = jsonConvert.convert<UserProtocol>(json['protocol']);
	if (protocol != null) {
		userEntity.protocol = protocol;
	}
	final String? button = jsonConvert.convert<String>(json['button']);
	if (button != null) {
		userEntity.button = button;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['tip'] = entity.tip;
	data['title'] = entity.title;
	data['count'] = entity.count;
	data['form'] =  entity.form?.map((v) => v.toJson()).toList();
	data['protocol'] = entity.protocol?.toJson();
	data['button'] = entity.button;
	return data;
}

UserForm $UserFormFromJson(Map<String, dynamic> json) {
	final UserForm userForm = UserForm();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userForm.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		userForm.title = title;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		userForm.value = value;
	}
	final String? tip = jsonConvert.convert<String>(json['tip']);
	if (tip != null) {
		userForm.tip = tip;
	}
	final String? operate = jsonConvert.convert<String>(json['operate']);
	if (operate != null) {
		userForm.operate = operate;
	}
	return userForm;
}

Map<String, dynamic> $UserFormToJson(UserForm entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['value'] = entity.value;
	data['tip'] = entity.tip;
	data['operate'] = entity.operate;
	return data;
}

UserProtocol $UserProtocolFromJson(Map<String, dynamic> json) {
	final UserProtocol userProtocol = UserProtocol();
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		userProtocol.title = title;
	}
	final List<String>? content = jsonConvert.convertListNotNull<String>(json['content']);
	if (content != null) {
		userProtocol.content = content;
	}
	return userProtocol;
}

Map<String, dynamic> $UserProtocolToJson(UserProtocol entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['title'] = entity.title;
	data['content'] =  entity.content;
	return data;
}