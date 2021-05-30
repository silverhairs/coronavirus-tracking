import 'package:covid/src/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class MeasuresArticleScreen extends StatelessWidget {
  const MeasuresArticleScreen({
    Key? key,
    required this.peviousPageTitle,
  }) : super(key: key);

  final String peviousPageTitle;
  final String title = 'Protective measures';
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: peviousPageTitle,
        middle: Text(title),
      ),
      child: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/docs/protective_measures.md'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 60,
              ),
            );
          }
          if (!snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  FlutterRemix.error_warning_line,
                  size: 40,
                  color: CupertinoColors.systemGrey,
                ),
                SizedBox(height: 24),
                Text('Failed to load!'),
              ],
            );
          }
          return SizedBox(
            height: screenHeight(context) - (kToolbarHeight),
            child: Markdown(
              styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: kBottomNavigationBarHeight,
              ),
              shrinkWrap: true,
              data: snapshot.data!,
              styleSheet: MarkdownStyleSheet(
                textAlign: WrapAlignment.start,
              ),
              onTapLink: (text, href, alt) => url_launcher.launch(
                href!,
                forceWebView: true,
                enableJavaScript: true,
                forceSafariVC: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
