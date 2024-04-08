import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/card_model.dart';

class ApiProvider {
  Future<List<CardModel>> getUserInfo() async {
    List<CardModel> users = [];
    Dio dio = Dio();
    try {
      Response response = await dio.get("https://crudapi.co.uk/api/v1/card",
          options: Options(headers: {
            "Authorization":
                "Bearer cttX0DZKQPY13xCM4U3J0KQ6UA7_8Bw24xRUdNMP6sbSDNj6bw",
            "Content-Type": "application/json"
          }));
      if (response.statusCode == HttpStatus.ok) {
        users = (response.data["items"] as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
            [];

        return users;
      }
    } catch (error) {
      debugPrint(error.toString());
    }

    return users;
  }

  Future<String> postUserInfo({required CardModel userModel}) async {
    Dio dio = Dio();
    String text = "";
    try {
      Response response = await dio.post(
        "https://crudapi.co.uk/api/v1/card",
        data: jsonEncode([userModel.toJson()]),
        options: Options(
          headers: {
            "Authorization":
                "Bearer cttX0DZKQPY13xCM4U3J0KQ6UA7_8Bw24xRUdNMP6sbSDNj6bw",
            "Content-Type": "application/json"
          },
        ),
      );
      if (response.statusCode == HttpStatus.created) {
        text = "created";
        return text;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return text;
  }

  Future<String> deleteUserInfo({required String uuid}) async {
    Dio dio = Dio();
    String text = "";
    try {
      Response response = await dio.delete(
        "https://crudapi.co.uk/api/v1/card",
        data: jsonEncode([
          {"_uuid": uuid}
        ]),
        options: Options(
          headers: {
            "Authorization":
                "Bearer cttX0DZKQPY13xCM4U3J0KQ6UA7_8Bw24xRUdNMP6sbSDNj6bw",
            "Content-Type": "application/json"
          },
        ),
      );
      if (response.statusCode == HttpStatus.created) {
        text = "created";
        return text;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return text;
  }

  Future<String> updateUserInfo({required CardModel userModel}) async {
    Dio dio = Dio();
    String text = "";
    try {
      Response response = await dio.put(
        "https://crudapi.co.uk/api/v1/card",
        data: jsonEncode([userModel.toJsonForUpdate()]),
        options: Options(
          headers: {
            "Authorization":
                "Bearer cttX0DZKQPY13xCM4U3J0KQ6UA7_8Bw24xRUdNMP6sbSDNj6bw",
            "Content-Type": "application/json"
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        text = "updated";
        return text;
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return text;
  }
}
