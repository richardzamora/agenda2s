import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionsAviableWidget extends StatelessWidget {
  const SessionsAviableWidget({
    super.key,
    required this.sessionList,
    required this.onSelect,
  });

  final List<Session> sessionList;
  final Function(Session) onSelect;

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat('hh:mm a / dd-MMM-yyyy');
    return Column(
      children: [
        Text(
          'Tus sesiones disponibles',
          style: AgTextStyle.ralewayStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: AgColors.inverseSurfaceColor(context),
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8),
        for (Session session in sessionList)
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
            child: AgCardElement(
              title: session.description,
              subtitle: formater.format(session.date!),
              onTap: () => onSelect(session),
              content: [session.place ?? ''],
            ),
          ),
      ],
    );
  }
}
