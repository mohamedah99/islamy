import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/home/hadeth.dart';
import 'package:islamy/ui/home/hadethTitleItem.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  @override
  Widget build(BuildContext context) {
    if (fullHadeth.isEmpty) {
      readAhadethFile();
    }

    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png'),
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2))),
            child: Text(
              "Ahadeth",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  HadethTitleItem(fullHadeth[index]),
              separatorBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    height: 2,
                  ),
              itemCount: fullHadeth.length),
        )
      ],
    );
  }

  List<HadethModel> fullHadeth = [];

  void readAhadethFile() async {
    String ahadethFile =
        await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> ahadethList = ahadethFile.trim().split("#");
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> oneHadeth = ahadethList[i].trim().split("\n");
      String hadethTitle = oneHadeth[0];
      oneHadeth.removeAt(0);
      String hadethContent = oneHadeth.join(" ");
      fullHadeth.add(HadethModel(hadethTitle, hadethContent));
    }
    setState(() {});
  }
}
