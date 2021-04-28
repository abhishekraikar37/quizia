import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opentdb_client/opentdb_client.dart';
import 'package:quizia/components/card.dart';
import 'package:quizia/components/list_tile.dart';
import 'package:quizia/question_brain.dart';
import 'package:quizia/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<OpentdbQuizItem> quizItems;
  Color movie = Colors.white;
  Color science = Colors.white;
  Color music = Colors.white;
  Color sports = Colors.white;
  Color geography = Colors.white;
  Color random = Color(0xFFef4572);
  String selector = 'Random';
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Container(color: Color(0xFF252c49)),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: My_Card(
                          onPress: () {
                            setState(() {
                              movie = Colors.white;
                              science = Colors.white;
                              music = Colors.white;
                              sports = Colors.white;
                              geography = Colors.white;
                              random = Color(0xFFef4572);
                              selector = 'Random';
                            });
                          },
                          child: FontAwesomeIcons.random,
                          color: random,
                          text: 'Random',
                        ),
                      ),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: My_Card(
                          onPress: () {
                            setState(() {
                              movie = Colors.white;
                              science = Color(0xFFef4572);
                              music = Colors.white;
                              sports = Colors.white;
                              geography = Colors.white;
                              random = Colors.white;
                              selector = 'Science and Nature';
                            });
                          },
                          child: FontAwesomeIcons.atom,
                          color: science,
                          text: 'Science',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: My_Card(
                          onPress: () {
                            setState(() {
                              movie = Colors.white;
                              science = Colors.white;
                              music = Color(0xFFef4572);
                              sports = Colors.white;
                              geography = Colors.white;
                              random = Colors.white;
                              selector = 'Music';
                            });
                          },
                          child: FontAwesomeIcons.recordVinyl,
                          color: music,
                          text: 'Music',
                        ),
                      ),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: My_Card(
                          onPress: () {
                            setState(() {
                              movie = Colors.white;
                              science = Colors.white;
                              music = Colors.white;
                              sports = Color(0xFFef4572);
                              geography = Colors.white;
                              random = Colors.white;
                              selector = 'Sports';
                            });
                          },
                          child: FontAwesomeIcons.volleyballBall,
                          color: sports,
                          text: 'Sports',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: My_Card(
                          onPress: () {
                            setState(() {
                              movie = Color(0xFFef4572);
                              science = Colors.white;
                              music = Colors.white;
                              sports = Colors.white;
                              geography = Colors.white;
                              random = Colors.white;
                              selector = 'Film';
                            });
                          },
                          child: FontAwesomeIcons.theaterMasks,
                          color: movie,
                          text: 'Movies',
                        ),
                      ),
                    ),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: My_Card(
                          onPress: () {
                            setState(() {
                              movie = Colors.white;
                              science = Colors.white;
                              music = Colors.white;
                              sports = Colors.white;
                              geography = Color(0xFFef4572);
                              random = Colors.white;
                              selector = 'Geography';
                            });
                          },
                          child: FontAwesomeIcons.globeAmericas,
                          color: geography,
                          text: 'Geography',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: My_ListTile(
                    iconData: FontAwesomeIcons.play,
                    text: 'Start Quiz',
                    color: Color(0xFF0e163a),
                    onPress: () async {
                      quizItems = await fetchQuiz(type: selector);
                      print(quizItems);
                      print(selector);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Question(
                            quizItem: quizItems,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: My_ListTile(
                      iconData: FontAwesomeIcons.cogs,
                      text: 'Settings',
                      color: Color(0xFF0e163a)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
