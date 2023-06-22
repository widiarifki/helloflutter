import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/appcontainer.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

/// `App` class is responsible to sets up the whole app:
/// - names the app
/// - creates app-wide state, support by ChangeNotifierProvider
/// - defines visual theme
/// - sets 'home' widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppGlobalState(),
      child: MaterialApp(
          title: "Namer App",
          home: AppContainer(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          )),
    );
  }
}

class AppGlobalState extends ChangeNotifier {
  String randomWord = WordPair.random().asLowerCase;
  var favWords = <String>[];

  void nextWord() {
    randomWord = WordPair.random().asLowerCase;
    notifyListeners();
  }

  void toggleFavorite(String currentWord) {
    if (favWords.contains(currentWord)) {
      favWords.remove(currentWord);
    } else {
      favWords.add(currentWord);
    }
    notifyListeners();
  }
}
