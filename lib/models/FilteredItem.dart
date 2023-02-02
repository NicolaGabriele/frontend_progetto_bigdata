import 'package:frontend_progetto_bigdata/Models/FilteredItem.dart';

class FilteredItem {
  String _indirizzo;
  String _punteggio;
  String _nomeHotel;
  String _latitudine;
  String _longitudine;
  FilteredItem(this._indirizzo, this._punteggio, this._nomeHotel, this._latitudine, this._longitudine);

  String getIndirizzo(){
    return this._indirizzo;
  }

  String getPunteggio(){
    return this._punteggio;
  }

  String getNomeHotel(){
    return this._nomeHotel;
  }

  String getLatitudine(){
    return this._latitudine;
  }

  String getLongitudine(){
    return this._longitudine;
  }

  factory FilteredItem.fromJson(Map<String,dynamic> json)=>
      FilteredItem(json['indirizzo'], json['punteggio'], json['nomeHotel'], json['latitudine'], json['longitudine']);

}