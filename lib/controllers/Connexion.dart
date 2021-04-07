import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Connexion {
  //static final url = "http://10.156.91.79:51789/api/";

  // static final url = "http://192.168.43.25:8000/api/";
  // static final url = "http://10.156.81.236:8000/api/";
  static final url = "http://10.156.91.86:8000/api/";
  // static final url = "http://10.156.112.139:8080/api/";
  // static final url = "http://169.254.88.50:8000/api/";
  // 169.254.88.50
//  10.156.91.86
  var token;

  supprimer(lien) async {
    var fullUrl = url + lien;
    await getToken();
    return await http.delete(fullUrl, headers: _setHeader());
  }

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
    return await http.get(fullUrl, headers: _setHeader());
  }

  _setHeader() => {
        // 'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
