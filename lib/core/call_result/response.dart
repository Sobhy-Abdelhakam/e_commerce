import 'package:e_commerce/core/error/failures.dart';

class Response<T> {
  Failures? failures;
  T? data;
  bool get hasError => failures != null;
  Response(dynamic response) {
    if(response is Failures){
      this.failures = response;
    } else {
      this.data = response;
    }
  }
}