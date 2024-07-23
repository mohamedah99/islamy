import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = "QuranDetailsScreen";

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    QuranArguments arg =
        ModalRoute.of(context)?.settings.arguments as QuranArguments;

    if (lines.isEmpty) {
      readFilesQuran(arg.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(arg.title),
        ),
        body: Card(
            margin: EdgeInsets.all(20),
            elevation: 10,
            child: lines.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Text(
                            "${lines[index]} (${index + 1})",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                    separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 2,
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          color: Theme.of(context).primaryColor,
                        ),
                    itemCount: lines.length)
                : Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }

  List<String> lines = [];

  void readFilesQuran(int index) async {
    String quran = await rootBundle.loadString("assets/files/${index + 1}.txt");
    lines = quran.split("\n");
    print(lines.length);
    setState(() {});
  }
}

class QuranArguments {
  String title;
  int index;

  QuranArguments(this.title, this.index);
}
