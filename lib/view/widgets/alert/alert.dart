import 'dart:io';

import 'package:berita_app/utils/helper/color_helper.dart';
import 'package:berita_app/utils/helper/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class Alert {
  static dangerMessage(String message) {
    Get.snackbar(
      message.toString(),
      '',
      colorText: ThemeColor.whiteColor,
      backgroundColor: const Color(0xFFD9435E).withOpacity(0.9),
      icon: Center(
        child: Icon(
          CupertinoIcons.exclamationmark,
          color: ThemeColor.whiteColor,
        ),
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  static succes(String message) {
    Get.snackbar(
      message.toString(),
      '',
      colorText: ThemeColor.whiteColor,
      backgroundColor: const Color(0xFF198754).withOpacity(0.9),
      icon: Center(
        child: Icon(
          CupertinoIcons.exclamationmark,
          color: ThemeColor.whiteColor,
        ),
      ),
      snackPosition: SnackPosition.TOP,
    );
  }

  static Future<bool?> showWarning(BuildContext context,
      {String title = 'Konfirmasi',
      String subTitle =
          "Apakah Anda yakin ingin keluar \ndari aplikasi ini ?"}) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              content: Container(
                color: Colors.white,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2 - 3.5 * 24,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ThemeColor.whiteColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      color: ThemeColor.primaryColor,
                                      width: 1,
                                      style: BorderStyle.solid))),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            "Tidak",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                      width: Get.width / 2 - 3.5 * 24,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ThemeColor.primaryColor),
                          onPressed: () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else if (Platform.isIOS) {
                              exit(0);
                            }
                          },
                          child: Text(
                            "Ya",
                            style: whiteTextStyle,
                          )),
                    ),
                  ],
                ),
              ),
            ));
  }

  static void singleButton(BuildContext context, String title, String subTitle,
      {Function? onTap}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              content: Container(
                color: Colors.white,
                height: 50,
                child: Center(
                  child: SizedBox(
                    width: Get.width / 2 - 3.5 * 24,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: ThemeColor.primaryColor),
                        onPressed: () {
                          if (onTap != null) {
                            onTap();
                          }
                        },
                        child: Text(
                          "Ya",
                          style: whiteTextStyle,
                        )),
                  ),
                ),
              ),
            ));
  }
}
