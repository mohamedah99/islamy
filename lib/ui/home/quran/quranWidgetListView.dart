import 'package:flutter/material.dart';
import 'package:islamy/ui/quranDetails/quranDetailsScreen.dart';

class QuranTitleWidget extends StatelessWidget {
  String suraName;
  int versesNumber;
  int index;

  QuranTitleWidget(this.suraName, this.versesNumber, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, QuranDetailsScreen.routeName, arguments:QuranArguments(suraName, index) );
         
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          versesNumber.toString(),
          style: TextStyle(fontSize: 18),
        ),
        Text(
          suraName,
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}

