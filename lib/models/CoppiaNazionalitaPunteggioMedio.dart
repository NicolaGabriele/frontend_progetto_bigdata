
class CoppiaNazionalitaPunteggioMedio {
  String _nazionalita;
  double _punteggioMedio;

  CoppiaNazionalitaPunteggioMedio(this._nazionalita, this._punteggioMedio);

  String getNazionalita(){
    return _nazionalita;
  }

  double getPunteggioMedio(){
    return _punteggioMedio;
  }

  factory CoppiaNazionalitaPunteggioMedio.fromJson(Map<String,dynamic> json)=>
      CoppiaNazionalitaPunteggioMedio(json['nazionalita'], json['punteggioMedio']);

  @override
  String toString() {
    return 'CoppiaNazionalitaPunteggioMedio{_nazionalita: $_nazionalita $_punteggioMedio}';
  }
}