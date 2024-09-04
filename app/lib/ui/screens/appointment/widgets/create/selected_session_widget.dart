import 'package:agds/agds.dart';
import 'package:agenda2/agenda2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectedSessionWidget extends StatelessWidget {
  const SelectedSessionWidget({
    super.key,
    required this.session,
    required this.onDelete,
  });

  final Session session;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat('hh:mm a / dd-MMM-yyyy');
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
          child: AgCardElement(
            title: session.description,
            subtitle: formater.format(session.date!),
            icon: Icon(Icons.delete, color: AgColors.errorColor(context)),
            onIconTap: onDelete,
            content: [session.place ?? ''],
          ),
        ),
        Text(
          'Deseas añadir un comentario?',
          style: AgTextStyle.ralewayStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: AgColors.inverseSurfaceColor(context),
            fontSize: 12.0,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 28, right: 28, top: 8, bottom: 16),
          child: AgFormFieldElement(
            hintText: "Comentario",
          ),
        ),
        Center(
          child: SizedBox(
            width: 200,
            child: AgButton(
              onTap: () {},
              buttonText: 'Agendar',
              buttonType: AgButtonType.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
