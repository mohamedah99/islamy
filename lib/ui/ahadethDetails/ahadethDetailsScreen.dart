import 'package:flutter/material.dart';
import 'package:islamy/ui/home/hadeth.dart';

class Ahadethdetailsscreen extends StatelessWidget {
  static const String routeName = "Ahadethdetailsscreen";

  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel =
        ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadethModel.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 10,
                margin: EdgeInsets.all(24),
                child: Padding(
                  padding: const EdgeInsets.all(8.8),
                  child: SingleChildScrollView(
                      child: Text(hadethModel.content, style: TextStyle(fontSize: 20),textAlign: TextAlign.end,)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
