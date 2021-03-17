import 'dart:convert';

import 'Url.dart';
import 'package:dio/dio.dart';

class Category {
  final String postid;
  final String imagePath;
  final String name;
  Category({
    this.postid,
    this.imagePath,
    this.name,
  });
}

Future<List<Category>> getCategory() async {
  List<Category> cList = [];
  Dio dio = Dio();
  dynamic response = await dio.post(api + "product/allCategory");
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.data);

    for (dynamic res in data) {
      Category cData = Category(
        postid: res['category_id'],
        imagePath: res['category_image'],
        name: res['category_name'],
      );
      cList.add(cData);
    }
  }
  return cList;
}

class SubCategoryData {
  final String postid;
  final String imagePath;
  final String name;
  SubCategoryData({
    this.postid,
    this.imagePath,
    this.name,
  });
}

Future<List<SubCategoryData>> getSubCategory(categoryId) async {
  List<SubCategoryData> sList = [];
  Dio dio = Dio();
  FormData form = FormData.fromMap({
    "category": categoryId,
  });
  dynamic response = await dio.post(
    api + "product/getSubCategoryById",
    data: form,
  );
  if (response.statusCode == 200) {
    dynamic data = json.decode(response.data);
    print(data);
    for (dynamic res in data) {
      SubCategoryData sData = SubCategoryData(
        postid: res['subcategory_id'],
        imagePath: res['subcategory_image'],
        name: res['subcategory_name'],
      );
      sList.add(sData);
    }
  }
  return sList;
}
