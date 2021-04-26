import 'package:flutter_bxsh/model/home_page_content_entity.dart';

homePageContentEntityFromJson(HomePageContentEntity data, Map<String, dynamic> json) {
	if (json['slides'] != null) {
		data.slides = (json['slides'] as List).map((v) => HomePageContentSlides().fromJson(v)).toList();
	}
	if (json['shopInfo'] != null) {
		data.shopInfo = HomePageContentShopInfo().fromJson(json['shopInfo']);
	}
	if (json['integralMallPic'] != null) {
		data.integralMallPic = HomePageContentIntegralMallPic().fromJson(json['integralMallPic']);
	}
	if (json['couponsActList'] != null) {
		data.couponsActList = (json['couponsActList'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['toShareCode'] != null) {
		data.toShareCode = HomePageContentToShareCode().fromJson(json['toShareCode']);
	}
	if (json['recommend'] != null) {
		data.recommend = (json['recommend'] as List).map((v) => HomePageContentRecommend().fromJson(v)).toList();
	}
	if (json['advertesPicture'] != null) {
		data.advertesPicture = HomePageContentAdvertesPicture().fromJson(json['advertesPicture']);
	}
	if (json['floor1'] != null) {
		data.floor1 = (json['floor1'] as List).map((v) => HomePageContentFloor1().fromJson(v)).toList();
	}
	if (json['floor2'] != null) {
		data.floor2 = (json['floor2'] as List).map((v) => HomePageContentFloor2().fromJson(v)).toList();
	}
	if (json['floor3'] != null) {
		data.floor3 = (json['floor3'] as List).map((v) => HomePageContentFloor3().fromJson(v)).toList();
	}
	if (json['saoma'] != null) {
		data.saoma = HomePageContentSaoma().fromJson(json['saoma']);
	}
	if (json['newUser'] != null) {
		data.newUser = HomePageContentNewUser().fromJson(json['newUser']);
	}
	if (json['floor1Pic'] != null) {
		data.floor1Pic = HomePageContentFloor1Pic().fromJson(json['floor1Pic']);
	}
	if (json['floor2Pic'] != null) {
		data.floor2Pic = HomePageContentFloor2Pic().fromJson(json['floor2Pic']);
	}
	if (json['floorName'] != null) {
		data.floorName = HomePageContentFloorName().fromJson(json['floorName']);
	}
	if (json['category'] != null) {
		data.category = (json['category'] as List).map((v) => HomePageContentCategory().fromJson(v)).toList();
	}
	if (json['floor3Pic'] != null) {
		data.floor3Pic = HomePageContentFloor3Pic().fromJson(json['floor3Pic']);
	}
	if (json['reservationGoods'] != null) {
		data.reservationGoods = (json['reservationGoods'] as List).map((v) => v).toList().cast<dynamic>();
	}
	return data;
}

Map<String, dynamic> homePageContentEntityToJson(HomePageContentEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['slides'] =  entity.slides?.map((v) => v.toJson())?.toList();
	data['shopInfo'] = entity.shopInfo?.toJson();
	data['integralMallPic'] = entity.integralMallPic?.toJson();
	data['couponsActList'] = entity.couponsActList;
	data['toShareCode'] = entity.toShareCode?.toJson();
	data['recommend'] =  entity.recommend?.map((v) => v.toJson())?.toList();
	data['advertesPicture'] = entity.advertesPicture?.toJson();
	data['floor1'] =  entity.floor1?.map((v) => v.toJson())?.toList();
	data['floor2'] =  entity.floor2?.map((v) => v.toJson())?.toList();
	data['floor3'] =  entity.floor3?.map((v) => v.toJson())?.toList();
	data['saoma'] = entity.saoma?.toJson();
	data['newUser'] = entity.newUser?.toJson();
	data['floor1Pic'] = entity.floor1Pic?.toJson();
	data['floor2Pic'] = entity.floor2Pic?.toJson();
	data['floorName'] = entity.floorName?.toJson();
	data['category'] =  entity.category?.map((v) => v.toJson())?.toList();
	data['floor3Pic'] = entity.floor3Pic?.toJson();
	data['reservationGoods'] = entity.reservationGoods;
	return data;
}

homePageContentSlidesFromJson(HomePageContentSlides data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentSlidesToJson(HomePageContentSlides entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['urlType'] = entity.urlType;
	data['goodsId'] = entity.goodsId;
	return data;
}

homePageContentShopInfoFromJson(HomePageContentShopInfo data, Map<String, dynamic> json) {
	if (json['SHOP_CODE'] != null) {
		data.shopCode = json['SHOP_CODE'].toString();
	}
	if (json['leaderPhone'] != null) {
		data.leaderPhone = json['leaderPhone'].toString();
	}
	if (json['leaderImage'] != null) {
		data.leaderImage = json['leaderImage'].toString();
	}
	if (json['SHOP_NAME'] != null) {
		data.shopName = json['SHOP_NAME'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentShopInfoToJson(HomePageContentShopInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['SHOP_CODE'] = entity.shopCode;
	data['leaderPhone'] = entity.leaderPhone;
	data['leaderImage'] = entity.leaderImage;
	data['SHOP_NAME'] = entity.shopName;
	return data;
}

homePageContentIntegralMallPicFromJson(HomePageContentIntegralMallPic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentIntegralMallPicToJson(HomePageContentIntegralMallPic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentToShareCodeFromJson(HomePageContentToShareCode data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentToShareCodeToJson(HomePageContentToShareCode entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentRecommendFromJson(HomePageContentRecommend data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['mallPrice'] != null) {
		data.mallPrice = json['mallPrice'] is String
				? double.tryParse(json['mallPrice'])
				: json['mallPrice'].toDouble();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName'].toString();
	}
	if (json['gift_coupons_offline'] != null) {
		data.giftCouponsOffline = json['gift_coupons_offline'].toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId'].toString();
	}
	if (json['price'] != null) {
		data.price = json['price'] is String
				? double.tryParse(json['price'])
				: json['price'].toDouble();
	}
	return data;
}

Map<String, dynamic> homePageContentRecommendToJson(HomePageContentRecommend entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['mallPrice'] = entity.mallPrice;
	data['goodsName'] = entity.goodsName;
	data['gift_coupons_offline'] = entity.giftCouponsOffline;
	data['goodsId'] = entity.goodsId;
	data['price'] = entity.price;
	return data;
}

homePageContentAdvertesPictureFromJson(HomePageContentAdvertesPicture data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentAdvertesPictureToJson(HomePageContentAdvertesPicture entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentFloor1FromJson(HomePageContentFloor1 data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentFloor1ToJson(HomePageContentFloor1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['goodsId'] = entity.goodsId;
	return data;
}

homePageContentFloor2FromJson(HomePageContentFloor2 data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentFloor2ToJson(HomePageContentFloor2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['goodsId'] = entity.goodsId;
	return data;
}

homePageContentFloor3FromJson(HomePageContentFloor3 data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentFloor3ToJson(HomePageContentFloor3 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['goodsId'] = entity.goodsId;
	return data;
}

homePageContentSaomaFromJson(HomePageContentSaoma data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentSaomaToJson(HomePageContentSaoma entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentNewUserFromJson(HomePageContentNewUser data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentNewUserToJson(HomePageContentNewUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentFloor1PicFromJson(HomePageContentFloor1Pic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentFloor1PicToJson(HomePageContentFloor1Pic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentFloor2PicFromJson(HomePageContentFloor2Pic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentFloor2PicToJson(HomePageContentFloor2Pic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homePageContentFloorNameFromJson(HomePageContentFloorName data, Map<String, dynamic> json) {
	if (json['floor1'] != null) {
		data.floor1 = json['floor1'].toString();
	}
	if (json['floor2'] != null) {
		data.floor2 = json['floor2'].toString();
	}
	if (json['floor3'] != null) {
		data.floor3 = json['floor3'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentFloorNameToJson(HomePageContentFloorName entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['floor1'] = entity.floor1;
	data['floor2'] = entity.floor2;
	data['floor3'] = entity.floor3;
	return data;
}

homePageContentCategoryFromJson(HomePageContentCategory data, Map<String, dynamic> json) {
	if (json['mallCategoryId'] != null) {
		data.mallCategoryId = json['mallCategoryId'].toString();
	}
	if (json['mallCategoryName'] != null) {
		data.mallCategoryName = json['mallCategoryName'].toString();
	}
	if (json['bxMallSubDto'] != null) {
		data.bxMallSubDto = (json['bxMallSubDto'] as List).map((v) => HomePageContentCategoryBxMallSubDto().fromJson(v)).toList();
	}
	if (json['comments'] != null) {
		data.comments = json['comments'];
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentCategoryToJson(HomePageContentCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mallCategoryId'] = entity.mallCategoryId;
	data['mallCategoryName'] = entity.mallCategoryName;
	data['bxMallSubDto'] =  entity.bxMallSubDto?.map((v) => v.toJson())?.toList();
	data['comments'] = entity.comments;
	data['image'] = entity.image;
	return data;
}

homePageContentCategoryBxMallSubDtoFromJson(HomePageContentCategoryBxMallSubDto data, Map<String, dynamic> json) {
	if (json['mallSubId'] != null) {
		data.mallSubId = json['mallSubId'].toString();
	}
	if (json['mallCategoryId'] != null) {
		data.mallCategoryId = json['mallCategoryId'].toString();
	}
	if (json['mallSubName'] != null) {
		data.mallSubName = json['mallSubName'].toString();
	}
	if (json['comments'] != null) {
		data.comments = json['comments'].toString();
	}
	return data;
}

Map<String, dynamic> homePageContentCategoryBxMallSubDtoToJson(HomePageContentCategoryBxMallSubDto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mallSubId'] = entity.mallSubId;
	data['mallCategoryId'] = entity.mallCategoryId;
	data['mallSubName'] = entity.mallSubName;
	data['comments'] = entity.comments;
	return data;
}

homePageContentFloor3PicFromJson(HomePageContentFloor3Pic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> homePageContentFloor3PicToJson(HomePageContentFloor3Pic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}