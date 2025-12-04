import 'package:mine_lab/data/model/global/meassage_model.dart';

class DepositMethodResponseModel {
  DepositMethodResponseModel({String? remark, Message? message, Data? data}) {
    _remark = remark;
    _message = message;
    _data = data;
  }

  DepositMethodResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _message =
        json["message"] == null ? null : Message.fromJson(json["message"]);
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _remark;
  Message? _message;
  Data? _data;

  String? get remark => _remark;
  Message? get message => _message;
  Data? get data => _data;
}

class Data {
  List<AppPaymentGateway>? gatewayCurrency;
  String? gatewayImage;
  Data({this.gatewayCurrency, this.gatewayImage});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gatewayCurrency: json["methods"] != null
            ? List<AppPaymentGateway>.from(
                json["methods"]!.map((x) => AppPaymentGateway.fromJson(x)))
            : [],
        gatewayImage: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "methods": gatewayCurrency?.map((x) => x.toJson()).toList(),
        "image_path": gatewayImage,
      };
}

class AppPaymentGateway {
  String? id;
  String? name;
  String? currency;
  String? symbol;
  String? methodCode;
  String? gatewayAlias;
  String? minAmount;
  String? maxAmount;
  String? percentCharge;
  String? fixedCharge;
  String? rate;
  String? createdAt;
  String? updatedAt;
  AppPaymentMethod? method;

  AppPaymentGateway({
    this.id,
    this.name,
    this.currency,
    this.symbol,
    this.methodCode,
    this.gatewayAlias,
    this.minAmount,
    this.maxAmount,
    this.percentCharge,
    this.fixedCharge,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.method,
  });

  factory AppPaymentGateway.fromJson(Map<String, dynamic> json) =>
      AppPaymentGateway(
        id: json["id"].toString(),
        name: json["name"].toString(),
        currency: json["currency"].toString(),
        symbol: json["symbol"].toString(),
        methodCode: json["method_code"].toString(),
        gatewayAlias: json["gateway_alias"].toString(),
        minAmount: json["min_amount"].toString(),
        maxAmount: json["max_amount"].toString(),
        percentCharge: json["percent_charge"].toString(),
        fixedCharge: json["fixed_charge"].toString(),
        rate: json["rate"].toString(),
        createdAt: json["created_at"]?.toString(),
        updatedAt: json["updated_at"]?.toString(),
        method: json["method"] == null
            ? null
            : AppPaymentMethod.fromJson(json["method"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
        "symbol": symbol,
        "method_code": methodCode,
        "gateway_alias": gatewayAlias,
        "min_amount": minAmount,
        "max_amount": maxAmount,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "method": method?.toJson(),
      };
}

class AppPaymentMethod {
  String? id;
  String? name;
  String? image;
  String? cityMinFare;
  String? cityMaxFare;
  String? cityRecommendFare;
  String? cityFareCommission;
  String? intercityMinFare;
  String? intercityMaxFare;
  String? intercityRecommendFare;
  String? intercityFareCommission;
  String? status;
  String? createdAt;
  String? updatedAt;

  AppPaymentMethod({
    this.id,
    this.name,
    this.image,
    this.cityMinFare,
    this.cityMaxFare,
    this.cityRecommendFare,
    this.cityFareCommission,
    this.intercityMinFare,
    this.intercityMaxFare,
    this.intercityRecommendFare,
    this.intercityFareCommission,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory AppPaymentMethod.fromJson(Map<String, dynamic> json) =>
      AppPaymentMethod(
        id: json["id"].toString(),
        name: json["name"],
        image: json["image"],
        cityMinFare: json["city_min_fare"].toString(),
        cityMaxFare: json["city_max_fare"].toString(),
        cityRecommendFare: json["city_recommend_fare"].toString(),
        cityFareCommission: json["city_fare_commission"].toString(),
        intercityMinFare: json["intercity_min_fare"].toString(),
        intercityMaxFare: json["intercity_max_fare"].toString(),
        intercityRecommendFare: json["intercity_recommend_fare"].toString(),
        intercityFareCommission: json["intercity_fare_commission"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "city_min_fare": cityMinFare,
        "city_max_fare": cityMaxFare,
        "city_recommend_fare": cityRecommendFare,
        "city_fare_commission": cityFareCommission,
        "intercity_min_fare": intercityMinFare,
        "intercity_max_fare": intercityMaxFare,
        "intercity_recommend_fare": intercityRecommendFare,
        "intercity_fare_commission": intercityFareCommission,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
