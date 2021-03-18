class ConfigStatic {
    List<ImageLunch> imageLunch;
    ImageInvite imageInvite;
    HoverHome hoverHome;
    TipsGoodsDetail tipsGoodsDetail;
    bool subscribeState;

    ConfigStatic(
        {this.imageLunch,
            this.imageInvite,
            this.hoverHome,
            this.tipsGoodsDetail,
            this.subscribeState});

    ConfigStatic.fromJson(Map<String, dynamic> json) {
        if (json['image_lunch'] != null) {
            imageLunch = new List<ImageLunch>();
            json['image_lunch'].forEach((v) {
                imageLunch.add(new ImageLunch.fromJson(v));
            });
        }
        imageInvite = json['image_invite'] != null
            ? new ImageInvite.fromJson(json['image_invite'])
            : null;
        hoverHome = json['hover_home'] != null
            ? new HoverHome.fromJson(json['hover_home'])
            : null;
        tipsGoodsDetail = json['tips_goods_detail'] != null
            ? new TipsGoodsDetail.fromJson(json['tips_goods_detail'])
            : null;
        subscribeState = json['subscribe_state'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.imageLunch != null) {
            data['image_lunch'] = this.imageLunch.map((v) => v.toJson()).toList();
        }
        if (this.imageInvite != null) {
            data['image_invite'] = this.imageInvite.toJson();
        }
        if (this.hoverHome != null) {
            data['hover_home'] = this.hoverHome.toJson();
        }
        if (this.tipsGoodsDetail != null) {
            data['tips_goods_detail'] = this.tipsGoodsDetail.toJson();
        }
        data['subscribe_state'] = this.subscribeState;
        return data;
    }
}

class ImageLunch {
    String url;

    ImageLunch({this.url});

    ImageLunch.fromJson(Map<String, dynamic> json) {
        url = json['url'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['url'] = this.url;
        return data;
    }
}

class ImageInvite {
    String pageHome;
    String pageMemberCenter;

    ImageInvite({this.pageHome, this.pageMemberCenter});

    ImageInvite.fromJson(Map<String, dynamic> json) {
        pageHome = json['page_home'];
        pageMemberCenter = json['page_member_center'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['page_home'] = this.pageHome;
        data['page_member_center'] = this.pageMemberCenter;
        return data;
    }
}

class HoverHome {
    String url;
    String page;
    bool state;

    HoverHome({this.url, this.page, this.state});

    HoverHome.fromJson(Map<String, dynamic> json) {
        url = json['url'];
        page = json['page'];
        state = json['state'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['url'] = this.url;
        data['page'] = this.page;
        data['state'] = this.state;
        return data;
    }
}

class TipsGoodsDetail {
    String content;

    TipsGoodsDetail({this.content});

    TipsGoodsDetail.fromJson(Map<String, dynamic> json) {
        content = json['content'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['content'] = this.content;
        return data;
    }
}
