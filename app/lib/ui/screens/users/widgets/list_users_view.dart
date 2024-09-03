import 'package:agds/agds.dart';
import 'package:agenda2/domain/models/user.dart';
import 'package:flutter/material.dart';

class ListUsersView extends StatelessWidget {
  const ListUsersView({
    super.key,
    required this.usersList,
  });

  final List<User>? usersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (usersList != null)
          for (User user in usersList!)
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: AgCardElement(
                title: user.email,
                subtitle: '${user.firstName} ${user.lastName}',
                icon: const Icon(Icons.edit),
                onTap: () {},
                onIconTap: () {},
              ),
            ),
      ],
    );
  }
}
