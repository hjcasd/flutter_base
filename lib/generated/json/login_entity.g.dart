import 'package:flutter_base/generated/json/base/json_convert_content.dart';
import 'package:flutter_base/data/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
	LoginEntity loginEntity = LoginEntity();
	var data = jsonConvert.convert<LoginData>(json['data']);
	if (data != null) {
		loginEntity.data = data;
	}
	var errorCode = jsonConvert.convert<int>(json['errorCode']);
	if (errorCode != null) {
		loginEntity.errorCode = errorCode;
	}
	var errorMsg = jsonConvert.convert<String>(json['errorMsg']);
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
	LoginData loginData = LoginData();
	var admin = jsonConvert.convert<bool>(json['admin']);
	if (admin != null) {
		loginData.admin = admin;
	}
	var chapterTops = jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
	if (chapterTops != null) {
		loginData.chapterTops = chapterTops;
	}
	var coinCount = jsonConvert.convert<int>(json['coinCount']);
	if (coinCount != null) {
		loginData.coinCount = coinCount;
	}
	var collectIds = jsonConvert.convertListNotNull<int>(json['collectIds']);
	if (collectIds != null) {
		loginData.collectIds = collectIds;
	}
	var email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		loginData.email = email;
	}
	var icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		loginData.icon = icon;
	}
	var id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		loginData.id = id;
	}
	var nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		loginData.nickname = nickname;
	}
	var password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginData.password = password;
	}
	var publicName = jsonConvert.convert<String>(json['publicName']);
	if (publicName != null) {
		loginData.publicName = publicName;
	}
	var token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		loginData.token = token;
	}
	var type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		loginData.type = type;
	}
	var username = jsonConvert.convert<String>(json['username']);
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