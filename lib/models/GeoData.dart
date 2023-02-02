

class GeoData{

  String _nome;
  String _indirizzo;
  String _score;
  String _latitudine;
  String _longitudine;

  GeoData(this._nome, this._indirizzo, this._score, this._latitudine, this._longitudine);

  @override
  factory GeoData.fromJson(Map<String,dynamic> json)=>
      GeoData(json['nome'],json['indirizzo'],json['score'],json['latitudine'], json['longitudine']);

  String getNome(){
    return _nome;
  }
  String getIndirizzo(){
    return _indirizzo;
  }
  String getScore(){
    return _score;
  }
  String getLatitudine(){
    return _latitudine;
  }

  String getLongitudine(){
    return _longitudine;
  }

  Map<String,dynamic> toJson()=>{
    "nome":_nome,
    "indirizzo":_indirizzo,
    "score":_score,
    "latitudine":_latitudine,
    "longitudine":_longitudine
  };

  @override
  String toString(){
    return "($_nome,$_indirizzo,$_score,$_latitudine,$_longitudine)";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoData &&
          runtimeType == other.runtimeType &&
          _latitudine == other._latitudine &&
          _longitudine == other._longitudine;

}