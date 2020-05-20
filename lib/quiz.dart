class Quiz {
  String appName;
  String eventConductedBy;
  List<QuizQuestions> quizQuestions;

  Quiz({this.appName, this.eventConductedBy, this.quizQuestions});

  Quiz.fromJson(Map<String, dynamic> json) {
    appName = json['AppName'];
    eventConductedBy = json['Event Conducted By'];
    if (json['Quiz Questions'] != null) {
      quizQuestions = new List<QuizQuestions>();
      json['Quiz Questions'].forEach((v) {
        quizQuestions.add(new QuizQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppName'] = this.appName;
    data['Event Conducted By'] = this.eventConductedBy;
    if (this.quizQuestions != null) {
      data['Quiz Questions'] =
          this.quizQuestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizQuestions {
  String questions;
  List<Answers> answers;

  QuizQuestions({this.questions, this.answers});

  QuizQuestions.fromJson(Map<String, dynamic> json) {
    questions = json['Questions'];
    if (json['Answers'] != null) {
      answers = new List<Answers>();
      json['Answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Questions'] = this.questions;
    if (this.answers != null) {
      data['Answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String answers;
  bool isTrue;

  Answers({this.answers, this.isTrue});

  Answers.fromJson(Map<String, dynamic> json) {
    answers = json['Answers'];
    isTrue = json['isTrue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Answers'] = this.answers;
    data['isTrue'] = this.isTrue;
    return data;
  }
}