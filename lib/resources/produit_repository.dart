import 'dart:convert';

import 'package:text1/model/api_res_model.dart';
import 'package:http/http.dart' as http;
import 'package:text1/repository/strings.dart';
abstract class FoodsRepository {
  Future<List<Foods>> getFoods();
}

class FoodsRepositoryImpl implements FoodsRepository {


  @override
  Future<List<Foods>> getFoods() async {
    var response = await http.get(AppStrings.produitsUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Foods> categories = ApiResultModel.fromJson(data).foods;
      print(categories.length.toString());
      return categories;
    } else {
      throw Exception();
    }
  }

}