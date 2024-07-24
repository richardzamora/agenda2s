import 'package:agds/atoms/ag_button_list_item.dart';
import 'package:flutter/material.dart';

class AgListButtons extends StatefulWidget {
  const AgListButtons(
      {required this.elements,
      required this.defaultElement,
      required this.onTapElement,
      super.key});

  final List<String> elements;
  final String defaultElement;
  final Function(String element) onTapElement;

  @override
  State<AgListButtons> createState() => _AgListButtonsState();
}

class _AgListButtonsState extends State<AgListButtons> {
  late String selectedElement;

  @override
  void initState() {
    super.initState();
    selectedElement = widget.defaultElement;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (String element in widget.elements)
          Flexible(
              child: AgButtonListItem(
            onTap: () {
              setState(() {
                selectedElement = element;
                widget.onTapElement(element);
              });
            },
            buttonText: element,
            buttonType: selectedElement == element
                ? AgButtonStyle.selected
                : AgButtonStyle.unselected,
          )),
      ],
    );
  }
}
