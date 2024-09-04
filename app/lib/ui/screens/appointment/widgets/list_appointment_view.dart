import 'package:agds/agds.dart';
import 'package:agenda2/domain/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListAppointmentView extends StatelessWidget {
  const ListAppointmentView({
    super.key,
    required this.appointmentList,
  });

  final List<Appointment>? appointmentList;

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat('hh:mm a / dd-MMM-yyyy');
    return Column(
      children: [
        if (appointmentList != null)
          for (Appointment appointment in appointmentList!)
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: AgCardElement(
                title: appointment.sessionDescription,
                subtitle: appointment.date != null
                    ? formater.format(appointment.date!)
                    : null,
                content: ['Lugar: ${appointment.placeName}'],
                onTap: () {},
              ),
            ),
      ],
    );
  }
}
