class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Quem são os goleiros da Seleção?",
    [
      Answer("Danilo, Alisson e Paquetá", false),
      Answer("Fred, Weverton e Alisson", false),
      Answer("Alisson, Ederson e Weverton", true),
      Answer("Fabinho, Casemiro e Antony", false),
    ],
  ));

  list.add(Question(
    "Quem são os laterais da Seleção?",
    [
      Answer("Danilo, Daniel Alves e Alex Teles", true),
      Answer("Casemiro, Pedro e Danilo", false),
      Answer("Raphinha, Rodrygo e Alisson", false),
      Answer("Ederson, Fred e Alexsandro", false),
    ],
  ));

  list.add(Question(
    "Quem são os Zagueiros da Seleção",
    [
      Answer("Thiago Silva, Marquinhos e Richarlison", false),
      Answer("Fabinho, Pedro e Martinelli", false),
      Answer("Thiago Silva, Bremer e Marquinhos", true),
      Answer("Alex Teles, Alisson e Éder Militão", false),
    ],
  ));

  list.add(Question(
    "Quem são os Meias da Seleção",
    [
      Answer("Fabinho, Neymar e Rodrygo", false),
      Answer("Casemiro, Fred e Paquetá", true),
      Answer("Raphinha, Daniel Alves e Weverton", false),
      Answer("Neymar, Antony e Gabriel Jesus", false),
    ],
  ));

  list.add(Question(
    "Quem são os Atacantes da Seleção",
    [
      Answer("Fabinho, Neymar e Richarlison", false),
      Answer("Rodrygo, Pedro e Paquetá", false),
      Answer("Alisson, Daniel Alves e Vinicius Junior", false),
      Answer("Neymar, Antony e Raphinha", true),
    ],
  ));

  list.add(Question(
    "Tite é o técnico da Seleção?",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));

  list.add(Question(
    "O Brasil é Hexacampeão?",
    [
      Answer("Verdadeiro", false),
      Answer("Falso", true),
    ],
  ));

  list.add(Question(
    "O Brasil foi campeão na Coreia/Japão?",
    [
      Answer("Verdadeiro", true),
      Answer("Falso", false),
    ],
  ));
  return list;
}
