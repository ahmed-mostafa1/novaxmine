import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mine_lab/views/components/appbar/custom_appbar.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/utils/my_color.dart';
import 'webview_widget.dart';

class WithdrawWebviewScreen extends StatefulWidget {
  const WithdrawWebviewScreen({super.key, required this.redirectUrl});
  final String redirectUrl;

  @override
  State<WithdrawWebviewScreen> createState() => _WithdrawWebviewScreenState();
}

class _WithdrawWebviewScreenState extends State<WithdrawWebviewScreen> {
  @override
  void initState() {
    super.initState();
    permissionServices();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        bgColor: MyColor.primaryColor,
        title: '',
        isShowBackBtn: true,
      ),
      body: MyWebViewWidget(url: widget.redirectUrl),
      floatingActionButton: favoriteButton(),
    );
  }

  Widget favoriteButton() {
    return FloatingActionButton(
      backgroundColor: MyColor.colorRed,
      onPressed: () async {
        Get.back();
      },
      child: const Icon(
        Icons.cancel,
        color: MyColor.colorWhite,
        size: 30,
      ),
    );
  }

  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
      Permission.microphone,
      Permission.mediaLibrary,
      Permission.camera,
      Permission.storage,
    ].request();

    return statuses;
  }
}
