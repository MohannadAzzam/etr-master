import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/controllers/controler_button.dart';
import 'package:etr/utils/enums.dart';

class SelectGender extends StatefulWidget {
 final GenderController controller ;
  const SelectGender({Key key, this.controller}) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  Gender gender = Gender.female  ;

  @override
  void initState() {
    if( widget.controller!=null) {
      gender = widget.controller.gender;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<Gender>(
              value: Gender.female,
              groupValue: gender,
              onChanged: (Gender value) {
                setState(() {
                  gender = value;
                  widget.controller.gender =value ;
                });
              },
            ),
            myText('Female'),
          ],
        ),
        Row(

          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<Gender>(
              value: Gender.male,
              groupValue: gender,
              onChanged: (Gender value) {
                setState(() {
                  gender = value;
                  widget.controller.gender =value ;
                });
              },
            ) , myText('Male'),

          ],
        ),
      ],
    );
  }
}
