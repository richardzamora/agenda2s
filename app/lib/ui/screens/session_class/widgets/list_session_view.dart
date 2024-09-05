import 'package:agds/agds.dart';
import 'package:agenda2/domain/models/schedule.dart';
import 'package:flutter/material.dart';

class ListSessionView extends StatelessWidget {
  const ListSessionView({
    super.key,
    required this.scheduleList,
  });

  final List<Schedule>? scheduleList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (scheduleList != null)
          for (Schedule schedule in scheduleList!)
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: AgCardElement(
                title: schedule.title,
                subtitle: '${schedule.professionalId}',
                icon: const Icon(Icons.edit),
                onTap: () {},
                onIconTap: () {},
              ),
            ),
      ],
    );
  }
}
