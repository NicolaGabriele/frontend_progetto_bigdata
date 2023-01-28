import 'dart:convert';

import 'package:frontend_progetto_bigdata/Models/FilteredItem.dart';
import 'package:frontend_progetto_bigdata/Models/ReviewsNumberItem.dart';
import 'package:frontend_progetto_bigdata/Models/WordCountItem.dart';
import 'package:frontend_progetto_bigdata/REST/RestManager.dart';

import '../Models/CoppiaHotelNumRecensioni.dart';
import '../Models/CoppiaHotelPunteggioMedio.dart';
import '../Models/GeoData.dart';
import 'Utility.dart';

class Query{

  Query._();

  static Future<List<GeoData>> geoDataHotelsInNation(String nation)async{
    List<GeoData> results = [];
    var response = await RestManager.submitSparkJob(Utility.geoDataHotelsInNation, {'nation':nation});
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(GeoData.fromJson(map));
    });
    return results;
  }


  static Future<List<WordCountItem>> wordCountPositive()async{
    List<WordCountItem> results = [];
    var response = await RestManager.submitSparkJob(Utility.wordCountPositive,Map());
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(WordCountItem.fromJson(map));
    });
    return results;
  }

  static Future<List<WordCountItem>> wordCountNegative()async{
    List<WordCountItem> results = [];
    var response = await RestManager.submitSparkJob(Utility.wordCountNegative, Map());
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(WordCountItem.fromJson(map));
    });
    return results;
  }

  static Future<List<CoppiaHotelPunteggioMedio>> coppieHotelPunteggioMedioPerNazione(String nation)async{
    List<CoppiaHotelPunteggioMedio> results = [];
    var response = await RestManager.submitSparkJob(Utility.coppieHotelPunteggioMedioPerNazione,
        {'nation':nation});
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(CoppiaHotelPunteggioMedio.fromJson(map));
    });
    return results;
  }

  static Future<List<String>> recensioniHotelDallaData(String hotel, int days)async{
    List<String> results = [];
    var response = await RestManager.submitSparkJob(Utility.recensioniHotelDallaData, {'hotel':hotel, 'days':days.toString()});
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {results.add(element);});
    return results;
  }

  static Future<List<CoppiaHotelNumRecensioni>> coppieHotel_NegReviews()async{
    List<CoppiaHotelNumRecensioni> results = [];
    var response = await RestManager.submitSparkJob(Utility.coppieHotel_NegReviews,
        Map());
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(CoppiaHotelNumRecensioni.fromJson(map));
    });
    return results;
  }

  static Future<List<CoppiaHotelNumRecensioni>> coppieHotel_PosReviews()async{
    List<CoppiaHotelNumRecensioni> results = [];
    var response = await RestManager.submitSparkJob(Utility.coppieHotel_PosReviews,
        Map());
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(CoppiaHotelNumRecensioni.fromJson(map));
    });
    return results;
  }

  static Future<List<FilteredItem>> averageScoreFilter(String punteggio)async{
    List<FilteredItem> results = [];
    var response = await RestManager.submitSparkJob(Utility.averageScoreFilter,
        {'punteggio':punteggio});
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(FilteredItem.fromJson(map));
    });
    return results;
  }

  static Future<List<ReviewsNumberItem>> reviewsNumberFilter(int num)async{
    List<ReviewsNumberItem> results = [];
    var response = await RestManager.submitSparkJob(Utility.reviewsNumberFilter,
        {'num':num.toString()});
    List<dynamic> l = jsonDecode(response);
    l.forEach((element) {
      Map<String,dynamic> map = element;
      results.add(ReviewsNumberItem.fromJson(map));
    });
    return results;
  }

}