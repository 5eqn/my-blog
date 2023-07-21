import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:minimal/posts/blog.dart';
import 'package:minimal/routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:minimal/model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ArticleProvider(),
      child: const MyApp(),
    ),
  );
}

class ArticleProvider extends ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = true;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  ArticleProvider() {
    fetchArticles(); // Call fetchArticles here
  }

  Future<void> fetchArticles() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.249.45.98:114/articles'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _articles = data.map((entry) => Article.fromJson(entry)).toList();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class ConditionalRouteWidget extends StatelessWidget {
  final List<String>? routes;
  final List<String>? routesExcluded;
  final TransitionBuilder builder;
  final Widget child;

  const ConditionalRouteWidget(
      {Key? key,
      this.routes,
      this.routesExcluded,
      required this.builder,
      required this.child})
      : assert(routes == null || routesExcluded == null,
            'Cannot include `routes` and `routesExcluded`. Please provide an list of routes to include or exclude, not both.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    if (routes != null && routes!.contains(currentRoute)) {
      return builder(context, child);
    } else if (routesExcluded != null &&
        routesExcluded!.contains(currentRoute) == false) {
      return builder(context, child);
    }

    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Matrix",
      // Wrapping the app with a builder method makes breakpoints
      // accessible throughout the widget tree.
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: '/',
      // The following code implements the legacy ResponsiveWrapper AutoScale functionality
      // using the new ResponsiveScaledBox. The ResponsiveScaledBox widget preserves
      // the legacy ResponsiveWrapper behavior, scaling the UI instead of resizing.
      //
      // A ConditionalRouteWidget is used to showcase how to disable the AutoScale
      // behavior for a page.
      onGenerateRoute: (RouteSettings settings) {
        // A custom `fadeThrough` route transition animation.
        return Routes.fadeThrough(settings, (context) {
          // Wrap widgets with another widget based on the route.
          // Wrap the page with the ResponsiveScaledBox for desired pages.
          return ConditionalRouteWidget(
              routesExcluded: const [
                TypographyPage.name
              ], // Excluding a page from AutoScale.
              builder: (context, child) => MaxWidthBox(
                    // A widget that limits the maximum width.
                    // This is used to create a gutter area on either side of the content.
                    maxWidth: 1200,
                    background: Container(color: const Color(0xFFF5F5F5)),
                    child: ResponsiveScaledBox(
                        // ResponsiveScaledBox renders its child with a FittedBox set to the `width` value.
                        // Set the fixed width value based on the active breakpoint.
                        width: ResponsiveValue<double>(context,
                            conditionalValues: [
                              const Condition.equals(name: MOBILE, value: 450),
                              const Condition.between(
                                  start: 800, end: 1100, value: 800),
                              const Condition.between(
                                  start: 1000, end: 1200, value: 1000),
                              // There are no conditions for width over 1200
                              // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                            ]).value,
                        child: child!),
                  ),
              child: BouncingScrollWrapper.builder(
                  context, buildPage(settings.name ?? ''),
                  dragWithMouse: true));
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }

  // onGenerateRoute route switcher.
  // Navigate using the page name, `Navigator.pushNamed(context, ListPage.name)`.
  Widget buildPage(String name) {
    switch (name) {
      case '/':
      case ListPage.name:
        return const ListPage();
      case PostPage.name:
        return const PostPage();
      case TypographyPage.name:
        return const TypographyPage();
      default:
        return PostBlog(url: name);
    }
  }
}
