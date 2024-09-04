import 'dart:convert';

import 'package:agenda2/infraestructure/driven_adapters/ag_api_client.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../agenda2.dart';
import '../repository_mock/auth_api_mock.dart';

class AuthApi implements AuthGateway {
  AuthApi(BuildContext context) {
    _sessionProvider = Provider.of<SessionNotifier>(context, listen: false);
  }

  late SessionNotifier _sessionProvider;

  @override
  Future<Either<AppError, AuthSession>> authenticate(
      String email, String pass) async {
    try {
      String? response;
      if (LoadEnvHelper.isMock()) {
        response = json.encode(auth_response);
      } else {
        const endpoint = 'auth/login';
        response = await AgApiClient.post(
          endpoint,
          {"username": email, "password": pass},
        );
      }
      final user = sessionFromJson(response);
      _sessionProvider.setSessionData(user);
      return Right(user);
    } on AppError catch (error) {
      _sessionProvider.setSessionData(null);
      return Left(error);
    } on Exception catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}
