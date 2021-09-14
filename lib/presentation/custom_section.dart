import 'package:customized/customized.dart';
import 'package:flutter/material.dart';

class CustomSection extends StatelessWidget {
  final int currentIndex;

  /// items
  final List<String> items;

  /// highlights the selected section
  final Color activeColor;

  /// highlights the unselected sections
  final Color defaultColor;

  /// textStyle for section text
  final TextStyle? textStyle;

  /// when a session is selected
  final ValueChanged<int> onTap;

  CustomSection(
      {required this.currentIndex,
      required this.items,
      required this.activeColor,
      required this.onTap,
      this.textStyle,
      required this.defaultColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items.map((e) {
        var index = items.indexOf(e);
        var selected = (index == currentIndex);
        var color = (selected) ? activeColor : defaultColor;
        var isLast = (index == items.length - 1);
        return Expanded(
            child: Container(
          margin: EdgeInsets.only(right: (isLast) ? 0.0 : 8.0),
          child: _Section(
            value: e,
            selected: selected,
            color: color,
            textStyle: textStyle,
            onTap: () {
              if (onTap != null) {
                onTap(index);
              }
            },
          ),
        ));
      }).toList(),
    );
  }
}

class _Section extends StatelessWidget {
  final String value;
  final bool selected;
  final Color color;
  final TextStyle? textStyle;
  final VoidCallback onTap;

  _Section({
    required this.value,
    required this.color,
    required this.onTap,
    required this.selected,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(4.0)),
        child: Center(
          child: Txt(
            value,
            textStyle: (_) {
              var style = textStyle ?? _;
              return style.copyWith(
                  color: color,
                  fontWeight: (selected) ? FontWeight.bold : FontWeight.normal);
            },
          ),
        ),
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
