import 'package:flutter/material.dart';
import 'package:twozerofoureight/domain/theme_color/models/theme_color.dart';
import 'package:twozerofoureight/helpers/list_extensions.dart';

class ThemeColorPicker extends StatelessWidget {
  final List<ThemeColor> themeColors;
  final int currentIndex;

  const ThemeColorPicker(
      {Key key, @required this.themeColors, @required this.currentIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(0),
      elevation: 0,
      title: Text(
        "Pick Theme",
        // style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      content: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 20,
        runSpacing: 20,
        children: themeColors.indexedMap((i, e) => GestureDetector(
            onTap: () {
              Navigator.pop(context, i);
            },
            child: buildPickerItem(e, isActive: i == currentIndex))),
      ),
    );
  }

  Widget buildPickerItem(ThemeColor themeColor, {bool isActive = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 40,
        height: 40,
        child: isActive ? Icon(Icons.check, color: Colors.white) : null,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [themeColor.first, themeColor.second])),
      ),
    );
  }
}
