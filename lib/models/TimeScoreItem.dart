class TimeScoreItem {

  String _data; //todo usare il DataTime.utc?
  double _punteggio;

  TimeScoreItem(this._data,this._punteggio);

  String getData(){
    return _data;
  }

  double getScore(){
    return _punteggio;
  }

  @override
  factory TimeScoreItem.fromJson(Map<String,dynamic> json)=>
      TimeScoreItem(json['data'], json['punteggio']);



}