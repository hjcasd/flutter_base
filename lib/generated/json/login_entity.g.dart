import 'package:flutter_base/generated/json/base/json_convert_content.dart';
import 'package:flutter_base/data/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
	final LoginEntity loginEntity = LoginEntity();
	final LoginData? data = jsonConvert.convert<LoginData>(json['data']);
	if (data != null) {
		loginEntity.data = data;
	}
	final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
	if (errorCode != null) {
		loginEntity.errorCode = errorCode;
	}
	final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
	if (errorMsg != null) {
		loginEntity.errorMsg = errorMsg;
	}
	return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	data['errorCode'] = entity.errorCode;
	data['errorMsg'] = entity.errorMsg;
	return data;
}

LoginData $LoginDataFromJson(Map<String, dynamic> json) {
	final LoginData loginData = LoginData();
	final bool? admin = jsonConvert.convert<bool>(json['admin']);
	if (admin != null) {
		loginData.admin = admin;
	}
	final List<dynamic>? chapterTops = jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
	if (chapterTops != null) {
		loginData.chapterTops = chapterTops;
	}
	final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
	if (coinCount != null) {
		loginData.coinCount = coinCount;
	}
	final List<int>? collectIds = jsonConvert.convertListNotNull<int>(json['collectIds']);
	if (collectIds != null) {
		loginData.collectIds = collectIds;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		loginData.email = email;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		loginData.icon = icon;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		loginData.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		loginData.nickname = nickname;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginData.password = password;
	}
	final String? publicName = jsonConvert.convert<String>(json['publicName']);
	if (publicName != null) {
		loginData.publicName = publicName;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		loginData.token = token;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		loginData.type = type;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginData.username = username;
	}
	return loginData;
}

Map<String, dynamic> $LoginDataToJson(LoginData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['admin'] = entity.admin;
	data['chapterTops'] =  entity.chapterTops;
	data['coinCount'] = entity.coinCount;
	data['collectIds'] =  entity.collectIds;
	data['email'] = entity.email;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['password'] = entity.password;
	data['publicName'] = entity.publicName;
	data['token'] = entity.token;
	data['type'] = entity.type;
	data['username'] = entity.username;
	return data;
}