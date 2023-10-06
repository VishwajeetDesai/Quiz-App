import 'package:adv_basics/answerbuttonuse.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectAns,  });
  final void Function(String answer) onSelectAns;
  @override
  State<QuestionScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionScreen> {

  var currentQsIndex=0;
  void answerQs(String selectedAns){
    widget.onSelectAns(selectedAns);
    setState(() {
      
       currentQsIndex+=1;
      
    });
  }
  @override
  Widget build(context) {
    final currentQuestion=questions[currentQsIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text( 
              
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 188, 130, 236),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer,onTap: (){
                answerQs(answer); 
              },);
            }),
            
          ],
        ),
      ),
    );
  }
}
