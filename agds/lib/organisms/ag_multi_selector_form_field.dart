import 'package:agds/agds.dart';
import 'package:agds/tokens/shadows.dart';
import 'package:flutter/material.dart';

import '../molecules/ag_chip_element.dart';
import '../tokens/text_style.dart';

class AgMultiSelectorFormField extends StatefulWidget {
  const AgMultiSelectorFormField({
    this.hintText,
    this.prefixIcon,
    this.hasRequiredOption = false,
    this.selectorElements,
    this.defaultValueElements,
    this.onSelectedElement,
    super.key,
  });
  final bool hasRequiredOption;
  final String? hintText;
  final IconData? prefixIcon;
  final List<AgSelectorModel>? selectorElements;
  final List<AgSelectorModel>? defaultValueElements;
  final Function(List<AgSelectorModel>)? onSelectedElement;

  @override
  State<AgMultiSelectorFormField> createState() =>
      _AgMultiSelectorFormFieldState();
}

class _AgMultiSelectorFormFieldState extends State<AgMultiSelectorFormField> {
  late List<AgSelectorModel> selectedElements;

  @override
  void initState() {
    super.initState();
    selectedElements = widget.defaultValueElements ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AgColors.surfaceColor(context),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: inverseSurfaceShadow(context)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async => showSelector(context),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.hintText ?? '',
                      style: AgTextStyle.ralewayStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AgColors.inverseSurfaceColor(context)
                            .withOpacity(0.5),
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(left: 16),
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.end,
            runSpacing: 4,
            spacing: 4,
            children: [
              for (AgSelectorModel element in selectedElements)
                AgChipElement(
                  hasRequiredOption: widget.hasRequiredOption,
                  element: element,
                  onDeleted: () => setState(() {
                    selectedElements.remove(element);
                  }),
                ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> showSelector(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (dialogContext) => SimpleDialog(
              title: Text(widget.hintText ?? ''),
              children: [
                if (widget.selectorElements != null)
                  if (!widget.hasRequiredOption)
                    for (AgSelectorModel element in widget.selectorElements!)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        width: 200,
                        child: AgButton(
                          buttonText: element.text,
                          isEnable: !selectedElements.contains(element),
                          onTap: () {
                            setState(() {
                              selectedElements.add(element);
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                if (widget.hasRequiredOption)
                  for (AgSelectorModel element in widget.selectorElements!)
                    AgDualSelectorButton(
                      selectedElements: selectedElements,
                      element: element,
                      isEnabled: selectedElements.contains(element),
                      firstIcon: Icons.lock,
                      secondIcon: Icons.lock_open,
                      onFirstAction: () {
                        setState(() {
                          element.isRequired = true;
                          selectedElements.add(element);
                        });
                        Navigator.pop(context);
                      },
                      onSecondAction: () {
                        setState(() {
                          element.isRequired = false;
                          selectedElements.add(element);
                        });
                        Navigator.pop(context);
                      },
                    ),
              ],
            ));
  }
}
