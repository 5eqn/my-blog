import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

class TypographyPage extends StatelessWidget {
  static const String name = 'typography';

  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  const MinimalMenuBar(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom12,
                      child: Text("你好", style: headlineTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("欢迎阅读 5eqn 的 Matrix 主题博客",
                          style: subtitleTextStyle),
                    ),
                  ),
                  dividerSmall,
                  Container(
                    margin: marginBottom24,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("免责声明", style: headlineSecondaryTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom40,
                      child: Text(
                          "此系列博客可能含有一些事实性错误或个人偏见，主要用于对一些神秘学想法进行原始记录，且包含一些虚构创作和 AI 创作的成分。若您依据本博客做出的行动对您造成了后果，笔者不进行承担，请您知悉。",
                          style: bodyTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("联系方式", style: headlineSecondaryTextStyle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom40,
                      child: Text("QQ / 491100866", style: bodyTextStyle),
                    ),
                  ),
                  divider,
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
