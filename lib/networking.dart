import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';







final url="https://jsonplaceholder.typicode.com/photos";
  Future decoder()async{

      http.Response response=await http.get(Uri.parse(url));

      if(response.statusCode==200){
        //print(response.body);

        return jsonDecode(response.body);
        //var image_url=jsonDecode(response.body)['0']['url'];
      }
      else{
        print(response.statusCode);
      }
  }


  //void converter(){}