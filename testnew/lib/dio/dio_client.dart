import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:testnew/models/post.dart';
import 'package:testnew/models/voucher.dart';

class DioClient {
  // set up and define the methods for network operation
  final Dio dio = Dio();
  static const baseUrlPost = 'https://jsonplaceholder.typicode.com';
  static const postEndpoint = baseUrlPost + '/posts';
  static const voucherUrl = 'http://192.168.1.41/inq/voucherList';

  //Add method POST

  //get post
  Future<Post> fetchPost(int postId) async {
    try {
      final response = await dio.get(postEndpoint + '/$postId');
      print(response.toString());

      return Post.fromJson(response.data);
    } on DioError catch (error) {
      print('Status code: ' + error.response.statusCode.toString());
      throw Exception('Failed to fetch post $postId');
    }
  }

  Future<Post> createPost(int userId, String title, String body) async {
    try {
      final response = await dio.post(postEndpoint, data: {
        "userId": userId,
        "title": title,
        "body": body,
      });
      return Post.fromJson(response.data);
    } on DioError catch (error) {
      print('Status code: ' + error.response.statusCode.toString());
      throw Exception('Failed to create post ');
    }
  }

  Future<Voucher> getVoucher() async {
    try {
      print('Hello voucher');
      final response = await dio.get(voucherUrl);
      print('Hello voucher');
      print(response.toString());

      return Voucher.fromJson(response.data);
    } on DioError catch (error) {
      print('Status code: ' + error.response.statusCode.toString());
      throw Exception('Failed to fetch voucher');
    }
  }
}
