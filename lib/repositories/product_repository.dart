import 'package:dio/dio.dart';
import 'package:road_mate/constants.dart';

class ProductRespository {
  Dio dio = Dio();

  Future<Response> getAllProducts() async {
    try {
      Response response =
          await dio.get(kBaseUrl + kProductUrl, data: {"index": "1"});
      print(response.data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getProductById({required int id}) async {
    try {
      Response response = await dio
          .post(kBaseUrl + kProductDetailsUrl, data: {"productid": id});
      print(response.data);
      return response;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
