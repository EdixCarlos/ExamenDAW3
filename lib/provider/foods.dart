import 'dart:async';
import 'dart:convert';

import 'package:apirest/models/foods.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Foods>> fetchFoods(http.Client client) async {
  final response = await client.get(Uri.parse(
      'http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3'));
  return compute(parseFoods, response.body);
}

List<Foods> parseFoods(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Foods>((json) => Foods.fromJson(json)).toList();
}
