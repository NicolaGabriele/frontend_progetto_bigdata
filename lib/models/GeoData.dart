

class GeoData{

  String _latitudine;
  String _longitudine;
  GeoData(this._latitudine, this._longitudine);

  @override
  factory GeoData.fromJson(Map<String,dynamic> json)=>
      GeoData(json['latitudine'], json['longitudine']);

  String getLatitudine(){
    return _latitudine;
  }

  String getLongitudine(){
    return _longitudine;
  }

  Map<String,dynamic> toJson()=>{
    "latitudine":_latitudine,
    "longitudine":_longitudine
  };

  @override
  String toString(){
    return "($_latitudine,$_longitudine)";
  }

}