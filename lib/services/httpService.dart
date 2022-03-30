import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HTTPService{

final String urlBase = 'https://sios-server.herokuapp.com/api';

  

  Future<Response> sendAuthData(String usr, String pass) async {
    return await http.post(
        Uri.parse('$urlBase/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': usr,
          'password': pass,
        }),
      );
  }

  Future<Response> sendToken(String token) async{
    print(token);
    return await http.get(
        Uri.parse('$urlBase/auth/renew'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
  }

}