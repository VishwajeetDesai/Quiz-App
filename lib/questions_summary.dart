import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      shrinkWrap: true,
      itemCount: summaryData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    
                    shape: BoxShape.circle,
                    color: summaryData[index]['user_answer'].toString() ==
                            summaryData[index]['correct_answer'].toString()
                        ? Colors.green
                        : Colors.red,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      summaryData[index]['question'].toString(),
                      style: GoogleFonts.dmSerifDisplay(color: Colors.white,letterSpacing: 0.7),

                    ),
                    const SizedBox(height: 8,),
                    Text('Your Answer : ${summaryData[index]['user_answer']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            summaryData[index]['user_answer'].toString() ==
                                    summaryData[index]['correct_answer']
                                        .toString()
                                ? Colors.lightGreen
                                : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Text(

                      'Correct Answer : ${summaryData[index]['correct_answer']}',
                      style: const TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
