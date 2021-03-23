import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Connexion {
  //static final url = "http://10.156.91.79:51789/api/";

  static final url = "http://192.168.43.100:8000/api/";
  var token;

  deconnexion(lien) async {
    var fullurl = url + lien;
    await getToken();
    return await http.post(fullurl, headers: _setHeader());
  }

  getToken() async {
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    token = localstorage.getString('token') != null
        ? json.decode(localstorage.getString('token'))
        : '';
  }

  envoideDonnnee(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    await getToken();
    return await http.post(fullUrl, body: data, headers: _setHeader());
  }

  recuperation(apiUrl) async {
    var fullUrl = url + apiUrl;
    await getToken();
    return http.get(fullUrl, headers: _setHeader());
  }

  _setHeader() => {
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
