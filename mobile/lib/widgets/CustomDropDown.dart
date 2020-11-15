import 'package:eventPlanning/constants.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final int value;
  final String hint;
  final String errorText;
  final List<DropdownMenuItem> items;
  final Function onChanged;

  const CustomDropDown(
      {Key key,
      this.value,
      this.hint,
      this.items,
      this.onChanged,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: CColors.COLOR_SECUNDARY,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 5,
                bottom: 5,
              ),
              child: DropdownButton<int>(
                dropdownColor: CColors.COLOR_SECUNDARY,
                value: value,
                hint: Text(
                  hint,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: CColors.COLOR_SECUNDARY,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: CColors.COLOR_SECUNDARY.withOpacity(.7),
                ),
                items: items,
                isExpanded: true,
                underline: Container(),
                icon: Icon(Icons.keyboard_arrow_down),
                onChanged: (item) {
                  onChanged(item);
                },
              ),
            ),
          ),
          if (errorText != null)
            Padding(
              padding: EdgeInsets.only(
                left: 30,
                top: 10,
              ),
              child: Text(
                errorText,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red[800],
                ),
              ),
            )
        ],
      ),
    );
  }
}
