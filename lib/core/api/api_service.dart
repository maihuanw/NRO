import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
class ApiService {
  static final ApiService _apiService =ApiService();
  factory ApiService()=> _apiService;
  late Dio dio;
  ApiService._internal(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://dev.api.y99.vn/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        }
      )
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handle){
        final token =GetStorage().read("token");
        if(token !=null ){
          options.headers["Authorization"]= "Bearer $token";
        }
        return handle.next(options);
      },
      onResponse: (response, handle){
        print("Respons: ${response.statusCode} ${response.data}");
        return handle.next(response);
      },
      onError: (DioException e, handle){
        print("Error: ${e.response?.statusCode} ${e.message}");
        return handle.next(e);
      }
    ));
  }
  Future<Response> get(String endpoint, {Map<String, dynamic>? query}) async{
    return await dio.get(endpoint, queryParameters: query);
  }

  Future<Response> post (String endpoint, {dynamic data}) async{
    return await dio.post(endpoint,data: data);
  }

  Future<Response> put(String endpoint, {dynamic data}) async{
    return await dio.put(endpoint, data: data);
  }

  Future<Response> delete (String endpoint, {dynamic data})async{
    return await dio.delete(endpoint, data: data);
  }

}