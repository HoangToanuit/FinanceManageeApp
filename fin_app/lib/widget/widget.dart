import 'package:fin_app/widget/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/app_color.dart';

class ChildWidget extends StatelessWidget {
  Icon icon;
  BigText bigText;
  ChildWidget({super.key, required this.bigText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 70,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.mainColor,
        boxShadow: [
          BoxShadow(
            blurRadius:2,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 50,),
          bigText,
        ],
      ),
    );
  }
}