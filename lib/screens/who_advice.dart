import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class WhoAdvice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Protective measures'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/data/text.md"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data,
                  styleSheet: MarkdownStyleSheet(
                    textAlign: WrapAlignment.start,
                    p: TextStyle(fontSize: 16),
                    h2: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    h1: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
