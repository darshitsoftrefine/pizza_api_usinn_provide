import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class PizzaService {

  Future<List<Recipes>> getRecipe() async {
    final response = await http.get(Uri.parse("https://forkify-api.herokuapp.com/api/search?q=pizza#"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<Recipes> list = [];

      for(var i = 0; i < data['recipes'].length; i++){
        final entry = data['recipes'][i];
        list.add(Recipes.fromJson(entry));
      }
      return list;
    } else {
      throw Exception("HTTP Request Failed");
    }
  }
}