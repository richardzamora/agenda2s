import 'package:agds/agds.dart';
import 'package:agenda2/domain/models/schedule.dart';
import 'package:flutter/material.dart';

class CreateAppointmentView extends StatelessWidget {
  const CreateAppointmentView({
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
                onTap: () {},
                chips: schedule.categories
                        ?.map((category) => AgSelectorModel(
                            category.id ?? '', category.name ?? '',
                            isRequired: category.isMandatory))
                        .toList() ??
                    [],
              ),
            ),
      ],
    );
  }
}
