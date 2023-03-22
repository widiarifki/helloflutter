import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/favepage.dart';
import 'package:helloworld/homepage.dart';
import 'package:helloworld/shoppinglist.dart';

class AppContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
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
      case 2:
        content = ShoppingListPage();
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Shopping"),
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
