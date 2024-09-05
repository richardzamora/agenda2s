import 'dart:convert';

import 'package:agenda2/agenda2.dart';
import 'package:agenda2/domain/models/user.dart';
import 'package:agenda2/infraestructure/driven_adapters/ag_api_client.dart';
import 'package:agenda2/infraestructure/notifiers/users_notifier.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository_mock/users_api_mock.dart';

class UsersApi implements UserGateway {
  UsersApi(BuildContext context) {
    _sessionProvider = Provider.of<SessionNotifier>(context, listen: false);
    _usersProvider = Provider.of<UsersNotifier>(context, listen: false);
  }

  late SessionNotifier _sessionProvider;
  late UsersNotifier _usersProvider;

  @override
  Future<Either<AppError, List<User>>> getUsers() async {
    try {
      String? response;
      if (LoadEnvHelper.isMock()) {
        response = jsonEncode(users_response);
      } else {
        const endpoint = 'api/users';
        response = await AgApiClient.get(endpoint,
            securityToken: _sessionProvider.loggedInUser?.token);
      }
      final users = usersFromJson(response);
      _usersProvider.setUsersList(users);
      return Right(users);
    } on AppError catch (error) {
      _usersProvider.setUsersList(null);
      return Left(error);
    } on Exception catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}
