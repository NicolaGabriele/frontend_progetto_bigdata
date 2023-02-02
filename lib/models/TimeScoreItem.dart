class TimeScoreItem {

  String _data; //todo usare il DataTime.utc?
  double _punteggio;

  TimeScoreItem(this._data,this._punteggio);

  String getData(){
    return _data;
  }

  int getAnno(){
    List<String> splitted = _data.split("/");
    return int.parse(splitted.elementAt(2));
  }

  int getMese(){
    List<String> splitted = _data.split("/");
    return int.parse(splitted.elementAt(0));
  }

  int getGiorno(){
    List<String> splitted = _data.split("/");
    return int.parse(splitted.elementAt(1));
  }

  double getPunteggio(){
    return _punteggio;
  }

  @override
  factory TimeScoreItem.fromJson(Map<String,dynamic> json)=>
      TimeScoreItem(json['data'], json['punteggio']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeScoreItem &&
          runtimeType == other.runtimeType &&
          _punteggio == other._punteggio &&
          _data == other._data;

}