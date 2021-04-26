import 'package:flutter_bxsh/generated/json/base/json_convert_content.dart';
import 'package:flutter_bxsh/generated/json/base/json_field.dart';

class HomePageContentEntity with JsonConvert<HomePageContentEntity> {
	List<HomePageContentSlides> slides;
	HomePageContentShopInfo shopInfo;
	HomePageContentIntegralMallPic integralMallPic;
	List<dynamic> couponsActList;
	HomePageContentToShareCode toShareCode;
	List<HomePageContentRecommend> recommend;
	HomePageContentAdvertesPicture advertesPicture;
	List<HomePageContentFloor1> floor1;
	List<HomePageContentFloor2> floor2;
	List<HomePageContentFloor3> floor3;
	HomePageContentSaoma saoma;
	HomePageContentNewUser newUser;
	HomePageContentFloor1Pic floor1Pic;
	HomePageContentFloor2Pic floor2Pic;
	HomePageContentFloorName floorName;
	List<HomePageContentCategory> category;
	HomePageContentFloor3Pic floor3Pic;
	List<dynamic> reservationGoods;
}

class HomePageContentSlides with JsonConvert<HomePageContentSlides> {
	String image;
	int urlType;
	String goodsId;
}

class HomePageContentShopInfo with JsonConvert<HomePageContentShopInfo> {
	@JSONField(name: "SHOP_CODE")
	String shopCode;
	String leaderPhone;
	String leaderImage;
	@JSONField(name: "SHOP_NAME")
	String shopName;
}

class HomePageContentIntegralMallPic with JsonConvert<HomePageContentIntegralMallPic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentToShareCode with JsonConvert<HomePageContentToShareCode> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentRecommend with JsonConvert<HomePageContentRecommend> {
	String image;
	double mallPrice;
	String goodsName;
	@JSONField(name: "gift_coupons_offline")
	String giftCouponsOffline;
	String goodsId;
	double price;
}

class HomePageContentAdvertesPicture with JsonConvert<HomePageContentAdvertesPicture> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentFloor1 with JsonConvert<HomePageContentFloor1> {
	String image;
	String goodsId;
}

class HomePageContentFloor2 with JsonConvert<HomePageContentFloor2> {
	String image;
	String goodsId;
}

class HomePageContentFloor3 with JsonConvert<HomePageContentFloor3> {
	String image;
	String goodsId;
}

class HomePageContentSaoma with JsonConvert<HomePageContentSaoma> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentNewUser with JsonConvert<HomePageContentNewUser> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentFloor1Pic with JsonConvert<HomePageContentFloor1Pic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentFloor2Pic with JsonConvert<HomePageContentFloor2Pic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomePageContentFloorName with JsonConvert<HomePageContentFloorName> {
	String floor1;
	String floor2;
	String floor3;
}

class HomePageContentCategory with JsonConvert<HomePageContentCategory> {
	String mallCategoryId;
	String mallCategoryName;
	List<HomePageContentCategoryBxMallSubDto> bxMallSubDto;
	dynamic comments;
	String image;
}

class HomePageContentCategoryBxMallSubDto with JsonConvert<HomePageContentCategoryBxMallSubDto> {
	String mallSubId;
	String mallCategoryId;
	String mallSubName;
	String comments;
}

class HomePageContentFloor3Pic with JsonConvert<HomePageContentFloor3Pic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}
