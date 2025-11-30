import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/util.dart';
import '../global/meassage_model.dart';

class KycResponseModel {
  KycResponseModel({String? remark, String? status, Message? message, Data? data}) {
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
  }

  KycResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'] != null ? json['status'].toString() : '';
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _remark;
  String? _status;
  Message? _message;
  Data? _data;

  String? get remark => _remark;
  String? get status => _status;
  Message? get message => _message;
  Data? get data => _data;
}

class Data {
  Data({
    GlobalKYCForm? form,
    List<KycPendingData>? kycPendingData,
    String? path,
  }) {
    _form = form;
    _kycPendingData = kycPendingData;
    _path = path;
  }

  Data.fromJson(dynamic json) {
    _form = json['form'] != null ? GlobalKYCForm.fromJson(json['form']) : null;
    _kycPendingData = json['kyc_data'] == null ? [] : List<KycPendingData>.from(json["kyc_data"]!.map((x) => KycPendingData.fromJson(x)));
    _path = json["image_path"];
  }

  GlobalKYCForm? _form;
  String? _path;
  List<KycPendingData>? _kycPendingData;

  GlobalKYCForm? get form => _form;
  List<KycPendingData>? get kycPendingData => _kycPendingData;
  String? get path => _path;
}

class GlobalKYCForm {
  GlobalKYCForm({List<GlobalFormModel>? list}) {
    _list = list;
  }

  List<GlobalFormModel>? _list = [];
  List<GlobalFormModel>? get list => _list;

  GlobalKYCForm.fromJson(dynamic json) {
    var map = Map.from(json).map((key, value) => MapEntry(key, value));
    try {
      List<GlobalFormModel>? list = map.entries
          .map(
            (e) => GlobalFormModel(e.value['name'], e.value['label'], e.value['is_required'], e.value['instruction'], e.value['extensions'], (e.value['options'] as List).map((e) => e as String).toList(), e.value['type'], ''),
          )
          .toList();

      if (list.isNotEmpty) {
        list.removeWhere((element) => element.toString().isEmpty);
        _list?.addAll(list);
      }
      _list;
    } catch (e) {
      if (kDebugMode) {
        printX(e.toString());
      }
    }
  }
}

class GlobalFormModel {
  String? name;
  String? label;
  String? isRequired;
  String? instruction;
  String? extensions;
  List<String>? options;
  String? type;
  dynamic selectedValue;
  TextEditingController? textEditingController;
  File? imageFile;
  List<String>? cbSelected;
  // Added an optional parameter to initialize the textEditingController
  GlobalFormModel(this.name, this.label, this.isRequired, this.instruction, this.extensions, this.options, this.type, this.selectedValue, {this.cbSelected, this.imageFile, this.textEditingController}) {
    // Initialize textEditingController if not provided
    textEditingController ??= TextEditingController();
  }
}

class KycPendingData {
  String? name;
  String? type;
  String? value;

  KycPendingData({
    this.name,
    this.type,
    this.value,
  });

  factory KycPendingData.fromJson(Map<String, dynamic> json) => KycPendingData(
        name: json["name"],
        type: json["type"],
        value: json["value"] != null ? json["value"].toString() : '---',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "value": value,
      };
}
