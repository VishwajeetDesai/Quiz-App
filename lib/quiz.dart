import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screens.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizStateClass();
  }
}

class _QuizStateClass extends State<Quiz> {
  List<String> selectedAns=[];
  var activeScreen = 'start-screen';

  // Widget? activeScreen;

  // @override 
  // void initState() {
  //   super.initState();
  //   activeScreen=StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAns(String answer){
    selectedAns.add(answer);
    if(selectedAns.length==questions.length){
      setState(() {
        activeScreen='results-screen';
      });
    }
  }

  @override
  Widget build(context) {

    Widget screenWidget=StartScreen(switchScreen);

    if(activeScreen=='questions-screen'){
    screenWidget= QuestionScreen(onSelectAns: chooseAns,);
    }
    
    if(activeScreen=='results-screen'){
      screenWidget=  ResultsScreen(chosenAns: selectedAns,);
    
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 103, 51, 194),
            Color.fromARGB(255, 88, 13, 219)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),

          child: screenWidget ,
        ),
      ),
    );
  }
}
