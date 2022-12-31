
class CoppiaHotelPunteggioMedio{

  String _hotel;
  double _punteggioMedio;

  CoppiaHotelPunteggioMedio(this._hotel, this._punteggioMedio);

  String getHotel(){
    return _hotel;
  }

  double getPunteggioMedio(){
    return _punteggioMedio;
  }

  factory CoppiaHotelPunteggioMedio.fromJson(Map<String,dynamic> json)=>
      CoppiaHotelPunteggioMedio(json['hotel'], double.parse(json['punteggioMedio']));

}