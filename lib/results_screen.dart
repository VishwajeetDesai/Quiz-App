import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAns});

  final List<String> chosenAns;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAns[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQs = questions.length;
    final numCorrectqs = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'You answered $numCorrectqs out of $numTotalQs qs correct',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(child: QuestionSummary(getSummaryData())),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Quiz()),
                          (route) => false);
                    },
                    child: const Icon(Icons.restart_alt),
                  ),
                  const SizedBox(height: 4,),
                  const Text(
                    'Restart quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
