import 'package:flutter/material.dart';
import 'package:islamy/ui/ahadethDetails/ahadethDetailsScreen.dart';
import 'package:islamy/ui/home/hadeth.dart';

class HadethTitleItem extends StatelessWidget {
  HadethModel hadeth;

  HadethTitleItem(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Ahadethdetailsscreen.routeName, arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          hadeth.title,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
