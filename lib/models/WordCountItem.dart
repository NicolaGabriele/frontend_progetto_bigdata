
class WordCountItem {
  
  String _word;
  int _counter;

  WordCountItem(this._word,this._counter);
  
  String getWord(){
    return _word;
  }
  
  int getCounter(){
    return _counter;
  }

  @override
  factory WordCountItem.fromJson(Map<String,dynamic> json)=>
      WordCountItem(json['word'], json['counter']);



}