import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizcopa/pages/quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 19, 2),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Column(children: [
                Container(
                  width: 700,
                  height: 550,
                  child: Image.asset(
                    "assets/copa.png",
                  ),
                ),
                const Text(
                  "Copa Quiz",
                  style: TextStyle(
                    fontFamily: 'FjallaOne',
                    color: Colors.green,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  width: 280,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => QuizScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 230, 207, 0),
                        ),
                        child: Text(
                          'Jogar',
                          style: TextStyle(
                              fontFamily: 'FjallaOne',
                              fontSize: 27,
                              color: Colors.black),
                        )),
                  ),
                )
              ])
            ])));
  }
}
