import 'package:flutter/material.dart';
import "package:intl/intl.dart";

String convertDate(int timestamp) {
  String formatedDate = DateFormat("yyyy-MM.dd, (HH:mm)")
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));

  return formatedDate;
}

String convertDate1(int timestamp) {
  String formatedDate = DateFormat("EEEE,dd MMMM")
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));

  return formatedDate;
}

String convertTime(int timestamp) {
  String formatedTime = DateFormat("HH:mm a")
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));

  return formatedTime;
}

int convertGradus(double gradus) {
  return (gradus - 275.15).ceil();
}

String convertDay(int timestamp) {
  String formatedTime = DateFormat("EEEE")
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));

  return formatedTime;
}

backgroundHelper(String weather) {
  switch (weather) {
    case "Clouds":
      return Colors.blue[100];

    case "Rain":
      return Colors.grey[400];

    case "Clear":
      return Colors.blue;

    default:
      return Colors.black;
  }
}

weatherImage(String image) {
  switch (image) {
    case "01d":
      return "assets/Sun.png";
    case "02d":
      return "assets/cloudSun.png";
    case "03d":
      return "assets/cloud.png";
    case "04d":
      return "assets/cloud.png";
    case "09d":
      return "assets/rainCloud";
    case "10d":
      return "assets/sunnyRain.png";
    case "11d":
      return "assets/cloudLighning.png";
    case "13d":
      return "assets/snezhinka.png";
    case "50d":
      return "assets/veter.png";

    case "01n":
      return "assets/Sun.png";
    case "02n":
      return "assets/cloudSun.png";
    case "03n":
      return "assets/cloud.png";
    case "04n":
      return "assets/cloud.png";
    case "09n":
      return "assets/rainCloud";
    case "10n":
      return "assets/sunnyRain.png";
    case "11n":
      return "assets/cloudLighning.png";
    case "13n":
      return "assets/snezhinka.png";
    case "50n":
      return "assets/veter.png";

    default:
      return "";
  }
}
