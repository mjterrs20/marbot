class PostResult {
  String ans;
  String label;
  String maxScore;
  String quest;

  PostResult({this.ans, this.label, this.maxScore, this.quest});

  PostResult.fromJson(Map<String, dynamic> json) {
    ans = json['ans'];
    label = json['label'];
    maxScore = json['max_score '];
    quest = json['quest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ans'] = this.ans;
    data['label'] = this.label;
    data['max_score '] = this.maxScore;
    data['quest'] = this.quest;
    return data;
  }
}