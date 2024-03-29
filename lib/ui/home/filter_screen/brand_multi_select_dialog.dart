import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

class BrandMultiSelectDialog extends StatefulWidget {
  final List<String> items;
  const BrandMultiSelectDialog({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BrandMultiSelectDialogState();
}

class _BrandMultiSelectDialogState extends State<BrandMultiSelectDialog> {
  final List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        LocaleKeys.select_brand.tr(),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) =>
                        _itemChange(item, isChecked ?? false),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            LocaleKeys.cancel.tr(),
          ),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: Text(
            LocaleKeys.submit.tr(),
          ),
          onPressed: _submit,
        ),
      ],
    );
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }
}
