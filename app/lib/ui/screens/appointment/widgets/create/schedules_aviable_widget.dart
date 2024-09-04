import 'package:agds/agds.dart';
import 'package:agenda2/domain/models/schedule.dart';
import 'package:flutter/material.dart';

class SchedulesAviableWidget extends StatelessWidget {
  const SchedulesAviableWidget({
    super.key,
    required this.scheduleList,
    required this.onSelect,
  });

  final List<Schedule> scheduleList;
  final Function(Schedule) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tus agendas disponibles',
          style: AgTextStyle.ralewayStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: AgColors.inverseSurfaceColor(context),
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8),
        for (Schedule schedule in scheduleList)
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
            child: AgCardElement(
              title: schedule.title,
              subtitle: '${schedule.professionalId}',
              onTap: () => onSelect(schedule),
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
