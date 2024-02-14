import 'package:dio/dio.dart';
import 'package:laza_project/Model/error_model.dart';
import 'package:laza_project/Model/products.dart';
import 'package:laza_project/Model/result_model.dart';

class ProductService {
  Dio dio = Dio();
  String baseurl = ('https://dummyjson.com/products/');

  late Response response;
}

abstract class ProductServiceImp extends ProductService {
  Future<List<Resultmodel>> getallproducts();
  Future<Resultmodel> getoneproduct(num id);
}

class ProductServiceGet extends ProductServiceImp {
  @override
  Future<List<Resultmodel>> getallproducts() async {
    response = await dio.get(baseurl);
    if (response.statusCode == 200) {
      List<Products> productsList = List.generate(
          response.data['products'].length,
          (index) => Products.fromMap(response.data['products'][index]));
      return productsList;
    } else {
      return [ErrorModel(message: 'Error')];
    }
  }

  @override
  Future<Resultmodel> getoneproduct(num id) async {
    response = await dio.get('https://dummyjson.com/products/$id');
    Products oneprodcut = Products.fromMap(response.data);
    return oneprodcut;
  }
}
