import 'package:flutter/material.dart';
import 'package:quizcopa/models/question_model.dart';
import 'package:quizcopa/pages/home_page.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 19, 2),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 290,
                    height: 380,
                    child: Image.asset(
                      "assets/cbf.png",
                    ),
                  ),
                  _questionWidget(),
                  _answerList(),
                  _nextButton(),
                ]),
          ),
        ));
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Pergunta ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: 360,
          padding: const EdgeInsets.symmetric(
            vertical: 27,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: 390,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.yellow : Colors.green,
          onPrimary: isSelected ? Colors.black : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 48,
        child: ElevatedButton(
          child: Text(isLastQuestion ? "Enviar" : "Próxima"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.yellow,
            onPrimary: Colors.black,
          ),
          onPressed: () {
            if (isLastQuestion) {
              //display score

              showDialog(context: context, builder: (_) => _showScoreDialog());
            } else {
              //next question
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex++;
              });
            }
          },
        ),
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.5) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed
        ? "Boa,você é craque na nossa seleção! "
        : "Precisa assistir mais os jogos!";

    return AlertDialog(
      title: Text(
        title + "Sua pontuação foi: $score pontos",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
          child: const Text(
            "Jogar Novamente",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.yellow,
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()))),
    );
  }
}
