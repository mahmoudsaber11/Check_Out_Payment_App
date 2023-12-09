import 'package:dio/dio.dart';

class DioConsumer {
  final Dio dio = Dio();

  Future<Response> postData(
      {required body,
      required String url,
      required String token,
      String? contentType}) async {
    Response response = await dio.post(url,
        data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {'Authorization': "Bearer $token"}));
    return response;
  }
}
