import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.title});

  final String title;

  @override
  State<QuizPage> createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  bool answerSelected = false;
  bool quizFinished = false; // Track if the quiz is finished

  static List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is the capital of Palestine?',
      'answers': [
        {'text': 'Nablus', 'image': 'assets/images/nablus.jpg'},
        {'text': 'Ramallah', 'image': 'assets/images/rammallah.jpg'},
        {'text': 'Gaza', 'image': 'assets/images/gaza.jpg'},
        {'text': 'Jerusalem', 'image': 'assets/images/jarusalem.jpeg'},
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'What Palestine is bordered by to the east?',
      'answers': [
        {'text': 'Lebanon', 'image': 'assets/images/flag-lbn.png'},
        {'text': 'Jordan', 'image': 'assets/images/flag-jor.png'},
        {'text': 'Syria', 'image': 'assets/images/flag-syr.png'},
        {'text': 'Egypt', 'image': 'assets/images/flag-egy.png'},
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the Palestinian city known for the Al-Aqsa mosque and the Church of the Resurrection?',
      'answers': [
        {'text': 'Ramallah', 'image': 'assets/images/rammallah.jpg'},
        {'text': 'Gaza', 'image': 'assets/images/gaza.jpg'},
        {'text': 'Jerusalem', 'image': 'assets/images/jarusalem.jpeg'},
        {'text': 'Bethlehem', 'image': 'assets/images/bethlahem.jpg'},
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'What was Jaffa Famous?',
      'answers': [
        {'text': 'Orange', 'image': 'assets/images/orange.jpg'},
        {'text': 'Apple', 'image': 'assets/images/apple.jpg'},
        {'text': 'Guava', 'image': 'assets/images/guava.jpg'},
        {'text': 'Grapes', 'image': 'assets/images/grapes.jpg'},
      ],
      'correctAnswer': 0,
    },

  ];

  List<String?> selectedAnswers = List.filled(questionsWithAnswers.length, null);

  void showNoAnswerSelectedToast() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Please select an answer before proceeding."),
    ));
  }

  void goToNextQuestion() {
    if (!answerSelected) {
      showNoAnswerSelectedToast();
      return;
    }

    if (currentQuestionIndex + 1 < questionsWithAnswers.length) {
      setState(() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questionsWithAnswers.length;
        answerSelected = false;
      });
    } else {
      setState(() {
        quizFinished = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      quizFinished = false; // Reset quizFinished to allow restarting
      currentQuestionIndex = 0; // Reset question index
      answerSelected = false; // Reset answer selection
      selectedAnswers = List.filled(questionsWithAnswers.length, null); // Reset selected answers
    });
  }

  double calculateProgress() {
    return (currentQuestionIndex + 1) / questionsWithAnswers.length;
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] != null &&
          selectedAnswers[i] == questionsWithAnswers[i]['answers'][questionsWithAnswers[i]['correctAnswer']]['text']) {
        score++;
      }
    }
    return score;
  }
  @override
  Widget build(BuildContext context) {
    if (quizFinished) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Congratulations! You have completed the quiz.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Your Score: ${calculateScore()} out of ${questionsWithAnswers.length}",
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: restartQuiz,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                    ),
                    child: const Text(
                      "Restart Quiz",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      final questionWithAnswer = questionsWithAnswers[currentQuestionIndex];
      final question = questionWithAnswer['question'];
      final answers = questionWithAnswer['answers'];
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                const Text(
                  'Answer the question and gets points',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Question ${currentQuestionIndex + 1} of ${questionsWithAnswers.length}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.deepPurple),
                  textAlign: TextAlign.start,
                ),
                LinearProgressIndicator(
                  value: answerSelected
                      ? calculateProgress()
                      : currentQuestionIndex / questionsWithAnswers.length,
                color: Colors.deepPurple,),
                const SizedBox(height: 50.0),
                for (final answer in answers)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 100.0, // Increased height to accommodate image and text
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedAnswers[currentQuestionIndex] = answer['text'];
                            answerSelected = true; // Mark an answer as selected
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: selectedAnswers[currentQuestionIndex] == answer['text'] ? Colors.green : null,
                          disabledForegroundColor: selectedAnswers[currentQuestionIndex] == answer['text'] ? Colors.green : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 75, // Adjust the width as needed
                              height: 75, // Adjust the height as needed
                              margin: const EdgeInsets.only(right: 16.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(answer['image']), // Provide the image URL here
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                            Text(
                              answer['text'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: goToNextQuestion,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                    ),
                    child: const Text(
                      "Next Question",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}