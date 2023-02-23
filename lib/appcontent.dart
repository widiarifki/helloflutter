import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/favepage.dart';
import 'package:helloworld/homepage.dart';

class AppContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  int selectedMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (selectedMenuIndex) {
      case 0:
        content = HomePage();
        break;
      case 1:
        content = FavePage();
        break;
      default:
        throw UnimplementedError('no page for $selectedMenuIndex');
    }

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(child: PageContainer(content: content)),
        BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorit"),
            ],
            currentIndex: selectedMenuIndex,
            onTap: (index) => {
                  setState(() => {selectedMenuIndex = index})
                })
      ],
    )));
  }
}

class PageContainer extends StatelessWidget {
  final Widget content;

  const PageContainer({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.primaryContainer, child: content);
}
