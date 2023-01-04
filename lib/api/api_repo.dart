import 'package:dio/dio.dart';

class WeatherRepo{
  String? url;
  Map<String , dynamic>? payload;


  WeatherRepo({
    this.url,this.payload
  }) ;

  Dio dio = Dio();
void get({
  Function()? beforeSend,
  Function(dynamic data)? onSuccess,
  Function(dynamic error)? onError,

})
  {
    dio.get( url!, queryParameters: payload ).then((respons) {
      if(onSuccess != null) {
        onSuccess(respons.data);
      }
    }).catchError((error)
        {
          if(onError != null){
            onError(error);
          }
        });
  }
}