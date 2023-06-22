import 'package:flutter/material.dart';
import 'package:helloworld/app.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AppGlobalState appState = context.watch<AppGlobalState>();
    String currentWord = appState.randomWord;
    Icon faveIcon;
    if(appState.favWords.contains(currentWord)) {
      faveIcon = Icon(Icons.favorite);
    } else {
      faveIcon = Icon(Icons.favorite_border);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(word: currentWord),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(onPressed: () => {
                  appState.toggleFavorite(currentWord)
                }, label: Text("Like"), icon: faveIcon),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () => { appState.nextWord() }, child: Text("Next"))
              ],
            )
          ],
        ),
      ),
    );
    // return Placeholder();
  }
}

class BigCard extends StatelessWidget {
  final String word;

  const BigCard({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onPrimary);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(padding: EdgeInsets.all(20), child: Text(word, style: textStyle)),
    );
  }
}
