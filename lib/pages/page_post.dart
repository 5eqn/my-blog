import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

class PostPage extends StatelessWidget {
  static const String name = 'post';

  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: marginBottom12,
                  child: Text(
                    "A BETTER BLOG FOR WRITING 中文测试",
                    style: headlineTextStyle,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBodySecondary(text: "Writing  /  Project"),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBody(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus a pellentesque sit amet porttitor eget. Ipsum nunc aliquet bibendum enim facilisis gravida."),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBody(
                    text:
                        "Montes nascetur ridiculus mus mauris vitae ultricies leo. Vitae purus faucibus ornare suspendisse sed nisi lacus sed viverra. Magna sit amet purus gravida. In dictum non consectetur a erat nam. Et egestas quis ipsum suspendisse ultrices. Tempor orci dapibus ultrices in iaculis nunc sed augue. Feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam. Feugiat nisl pretium fusce id velit ut tortor pretium."),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextHeadlineSecondary(
                    text: "Secondary Headline Example 中文测试"),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBody(
                    text:
                        "Nullam lobortis faucibus cursus. Sed aliquam semper mi sit amet interdum. Aliquam felis quam, ultrices ut elementum a, porta vel ex. Pellentesque at tempus magna. Vestibulum viverra lectus quis laoreet ullamcorper. Nunc finibus orci in luctus hendrerit. Ut dui mi, lacinia hendrerit elit ut, malesuada luctus enim."),
              ),
              const TextBlockquote(
                  text:
                      "Arcu ac tortor dignissim convallis aenean et tortor. Neque vitae tempus quam pellentesque nec nam aliquam. Dictum varius duis at consectetur lorem donec massa sapien faucibus. Etiam tempor orci eu lobortis elementum nibh tellus molestie nunc. Ac odio tempor orci dapibus ultrices in iaculis nunc sed."),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBody(
                    text:
                        "中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试中文测试"),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TagWrapper(tags: [
                  Tag(tag: "Writing"),
                  Tag(tag: "Photography"),
                  Tag(tag: "Development")
                ]),
              ),
              ...authorSection(
                  imageUrl: "assets/images/avatar_default.png",
                  name: "Type Pages",
                  bio:
                      "Mattis molestie a iaculis at erat pellentesque adipiscing commodo. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget. Sed euismod nisi porta lorem. Aliquet nec ullamcorper sit amet risus nullam eget felis eget."),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: const PostNavigation(),
              ),
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
