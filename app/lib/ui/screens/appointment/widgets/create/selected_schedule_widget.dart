import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:flutter/material.dart';

class SelectedScheduleWidget extends StatelessWidget {
  const SelectedScheduleWidget({
    super.key,
    required this.selectedSchedule,
    required this.onDelete,
  });

  final Schedule? selectedSchedule;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Agendar cita para:',
          style: AgTextStyle.ralewayStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: AgColors.inverseSurfaceColor(context),
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
          child: AgCardElement(
            title: selectedSchedule!.title,
            subtitle: '${selectedSchedule!.professionalId}',
            icon: Icon(Icons.delete, color: AgColors.errorColor(context)),
            onIconTap: onDelete,
            chips: selectedSchedule!.categories
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
