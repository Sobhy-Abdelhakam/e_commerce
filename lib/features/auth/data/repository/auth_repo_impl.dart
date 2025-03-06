import 'dart:async';
import 'dart:io';

import 'package:e_commerce/core/call_result/response.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/shared_pref_helper.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/auth/data/dtos/user_dto.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final NetworkInfo networkInfo;
  AuthRepoImpl({required this.networkInfo});

  @override
  Future<bool> isUserSignedIn() {
    // TODO: implement isUserSignedIn
    throw UnimplementedError();
  }

  @override
  Future<Response<void>> resetPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
      return Response(null);
    } on AuthException catch (e) {
      return Response(ServerFailures(e.message));
    } on TimeoutException {
      return Response(ServerFailures("Request timed out. Please try again."));
    } on SocketException {
      // Handle network-related issues
      return Response(NetworkFailures("Network error. Check your connection."));
    } catch (e) {
      // Handle any other unexpected errors
      return Response(ServerFailures("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Response<UserInfo>> signIn(String email, String password) async {
    if (!await networkInfo.isConnected) {
      return Response(NetworkFailures("No Internet Connection"));
    }
    try {
      final response = await _supabase.auth
          .signInWithPassword(email: email, password: password);
      final user = response.user;
      if (user == null) {
        return Response(ServerFailures("Failed to sign in user"));
      }
      await SharedPrefHelper.setData(
          SharedPrefKeys.userToken, response.session?.accessToken);
      // Fetch additional user data
      // final userData = await _supabase
      //     .from('users')
      //     .select()
      //     .eq('id', response.user!.id)
      //     .single();
      //     final user = UserDto.fromJson(userData).toEntity();

      return Response(
        UserInfo(
            id: user.id,
            email: user.email!,
            phone: user.userMetadata?['phone'],
            name: user.userMetadata?['name']),
      );
      // return Response(user);
    } on AuthException catch (e) {
      return Response(ServerFailures(e.message));
    } on TimeoutException {
      return Response(ServerFailures("Request timed out. Please try again."));
    } on SocketException {
      // Handle network-related issues
      return Response(NetworkFailures("Network error. Check your connection."));
    } catch (e) {
      // Handle any other unexpected errors
      return Response(ServerFailures("Unexpected error: ${e.toString()}"));
    }
  }

  @override
  Future<Response<void>> signOut() async {
    try {
      await _supabase.auth.signOut();
      await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
      return Response(null);
    } catch (e) {
      return Response(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Response<UserInfo>> signUp(
      String name, String email, String password, String phoneNumber) async {
    if (!await networkInfo.isConnected) {
      return Response(NetworkFailures("No Internet Connection"));
    }

    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'phone': phoneNumber,
        },
      );
      if (response.user == null) {
        return Response(ServerFailures("Failed to register user"));
      }
      return Response(UserInfo(
          id: response.user!.id, name: name, email: email, phone: phoneNumber));
    } on AuthException catch (e) {
      return Response(ServerFailures(e.message));
    } on TimeoutException {
      return Response(ServerFailures("Request timed out. Please try again."));
    } on SocketException {
      // Handle network-related issues
      return Response(NetworkFailures("Network error. Check your connection."));
    } catch (e) {
      // Handle any other unexpected errors
      return Response(ServerFailures("Unexpected error: ${e.toString()}"));
    }
  }
}

extension on UserDto {
  UserInfo toEntity() {
    return UserInfo(
      id: id,
      email: email,
      name: name,
      phone: phone,
    );
  }
}
