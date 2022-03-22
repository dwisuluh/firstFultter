import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return MaterialApp(
    //   title: 'Welcome to Flutter',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   // home: const MyHomePage(title: 'Welcome to Flutter'),
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Welcome to Flutter'),),
    //       // body: Center(
    //       //   child: Text(wordPair.asPascalCase),
    //       // ),),
    //       body: Center(
    //         child: RandomWords(),
    //       ),),
    // );
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();

}

class _RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext contenxt){
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (contenxt, i){
          if (i.isOdd) return const Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}
