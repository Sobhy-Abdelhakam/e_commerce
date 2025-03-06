import 'dart:async';
import 'dart:io';

import 'package:e_commerce/core/call_result/response.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Response<T>> safeApiCall<T>(Future<T> Function() apiCall, dynamic networkInfo) async{
  if (!await networkInfo.isConnected) {
    return Response(NetworkFailures("No Internet Connection"));
  }

  try {
    final result = await apiCall();
    return Response(result);
  } on AuthException catch (e) {
    return Response(ServerFailures(e.message)); // Authentication errors (wrong password, etc.)
  } on TimeoutException {
    return Response(ServerFailures("Request timed out. Please try again."));
  } on SocketException {
    return Response(NetworkFailures("Network error. Check your connection."));
  } on FormatException {
    return Response(ServerFailures("Invalid response format."));
  } catch (e) {
    return Response(ServerFailures("Unexpected error: ${e.toString()}"));
  }
}