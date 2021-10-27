class PostResult {
  String ans;
  String label;
  String maxScore;
  String quest;
  dynamic questionRake;

  PostResult({this.ans, this.label, this.maxScore, this.quest, this.questionRake});

  PostResult.fromJson(Map<String, dynamic> json) {
    ans = json['ans'];
    label = json['label'];
    maxScore = json['max_score'];
    quest = json['quest'];
    questionRake = json['question_rake'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ans'] = this.ans;
    data['label'] = this.label;
    data['max_score'] = this.maxScore;
    data['quest'] = this.quest;
    data['question_rake'] = this.questionRake;
    return data;
  }
}