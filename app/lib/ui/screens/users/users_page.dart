import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:agenda2/domain/models/user.dart';
import 'package:agenda2/infraestructure/notifiers/users_notifier.dart';
import 'package:agenda2/ui/helpers/single_page_template.dart';
import 'package:agenda2/ui/screens/users/users_interface.dart';
import 'package:agenda2/ui/screens/users/users_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  static String routeName = "/users";
  const UsersPage({required this.userGateway, Key? key}) : super(key: key);

  final UserGateway userGateway;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> implements UsersInterface {
  late UsersPresenter presenter;

  @override
  void initState() {
    presenter = UsersPresenter(widget.userGateway, this);
    super.initState();
    presenter.getUsers();
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
              onTapElement: (value) {}),
          SizedBox(
            width: 400,
            child: Column(
              children: [
                if (usersList != null)
                  for (User user in usersList)
                    AgCardElement(
                      title: user.email,
                      subtitle: '${user.firstName} ${user.lastName}',
                      icon: Icon(Icons.edit),
                      onTap: () {},
                      onIconTap: () {},
                    ),
              ],
            ),
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
