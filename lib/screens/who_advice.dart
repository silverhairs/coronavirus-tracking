import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class WhoAdvice extends StatelessWidget {
  final bool isDark;
  WhoAdvice(this.isDark);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protective measures'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/docs/protective_measures.md"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data,
                  styleSheet: MarkdownStyleSheet(
                    textAlign: WrapAlignment.start,
                    p: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    h2: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    h1: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  strokeWidth: 5,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
