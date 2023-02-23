import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/app.dart';
import 'package:provider/provider.dart';

class FavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppGlobalState appState = context.watch<AppGlobalState>();
    Widget content;
    ThemeData theme = Theme.of(context);

    if (appState.favWords.isEmpty) {
      content = Center(
          child: Text("You haven't liked any words",
              style: theme.textTheme.titleLarge));
    } else {
      content = ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                  "You have ${appState.favWords.length} favorite words!",
                  style: theme.textTheme.titleMedium)),
          for (var word in appState.favWords)
            ListTile(
                leading: Icon(Icons.favorite),
                title: Row(children: [
                  Expanded(child: Text(word)),
                  OutlinedButton(
                      onPressed: () {
                        appState.toggleFavorite(word);
                      },
                      child: Text("Remove"))
                ]))
        ],
      );
    }

    return Scaffold(body: content);
  }
}
