import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';
import 'package:minimal/main.dart';
import 'package:minimal/model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PostBlog extends StatelessWidget {
  final String url;
  const PostBlog({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? parsedNumber = int.tryParse(url);
    Widget content;

// Check if the parsed number is not null and positive
    if (parsedNumber != null && parsedNumber >= 0) {
      content = Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          if (provider.articles.isEmpty ||
              provider.articles.length <= parsedNumber) {
            // If article not found, show a loading indicator.
            return const Text("文章不存在");
          }
          var article = provider.articles[parsedNumber];
          var widgets = article.content.map<Widget>((para) {
            switch (para.type) {
              case ParaType.primaryHeader:
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: marginBottom12,
                    child: Text(
                      para.content,
                      style: headlineTextStyle,
                    ),
                  ),
                );
              case ParaType.secondaryHeader:
                return Align(
                  alignment: Alignment.centerLeft,
                  child: TextHeadlineSecondary(text: para.content),
                );
              case ParaType.text:
                return Align(
                  alignment: Alignment.centerLeft,
                  child: TextBody(text: para.content),
                );
              case ParaType.code:
                return Align(
                    alignment: Alignment.centerLeft,
                    child: CodeBody(code: para.content, lang: para.metadata));
            }
          }).toList();
          widgets.insert(
              1,
              Align(
                alignment: Alignment.centerLeft,
                child: TextBodySecondary(
                    text: DateFormat('yyyy.MM.dd').format(article.createdAt)),
              ));
          return Column(children: widgets);
        },
      );
    } else {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: <Widget>[
              const MinimalMenuBar(),
              const ImageWrapper(
                image: "assets/images/mugs_side_bw_w1080.jpg",
              ),
              content,
              divider,
              // Footer
              const Footer(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
