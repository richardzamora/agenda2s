import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:agenda2/infraestructure/notifiers/users_notifier.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/screens/users/users_interface.dart';
import 'package:agenda2/ui/screens/users/users_presenter.dart';
import 'package:agenda2/ui/screens/users/widgets/list_users_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/create_user_view.dart';

class UsersPage extends StatefulWidget {
  static String routeName = "/users";
  const UsersPage({required this.userGateway, Key? key}) : super(key: key);

  final UserGateway userGateway;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> implements UsersInterface {
  late UsersPresenter presenter;
  String pageContent = 'Listar';

  @override
  void initState() {
    presenter = UsersPresenter(widget.userGateway, this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => presenter.getUsers());
  }

  @override
  Widget build(BuildContext context) {
    final usersList = Provider.of<UsersNotifier>(context).usersList;
    return SinglePageTemplate(
      UsersPage.routeName,
      title: 'Gestionar Usuarios',
      body: Column(
        children: [
          AgListButtons(
              elements: ['Listar', 'Crear'],
              defaultElement: 'Listar',
              onTapElement: (value) {
                setState(() {
                  pageContent = value;
                });
              }),
          const SizedBox(height: 12),
          SizedBox(
            width: 450,
            child: pageContent.contains('Listar')
                ? ListUsersView(usersList: usersList)
                : const CreateUserView(),
          ),
        ],
      ),
    );
  }

  bool isLoading = false;

  @override
  void hideLoading() {
    // TODO: implement hideLoading
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showError(AppError error) {
    // TODO: implement showError
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }
}
