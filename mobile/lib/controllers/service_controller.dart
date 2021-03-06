import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

class ServiceController {
  final Map<String, double> _manausCoord = {
    "maxLat": -2.9,
    "minLat": -3.1,
    "maxLong": -59.8,
    "minLong": -60.2
  };

  final Map<String, String> _manausUrl = {
    "ambulance": "http://192.168.0.2:3334",
    "police": "http://192.168.0.2:3334",
    "firedep": "http://192.168.0.2:3334",
  };

  bool compareCoordinates(Location location, Map<String, double> city) {
    if (location.lat < city["maxLat"] && location.lat > city["minLat"]) {
      if (location.lng < city["maxLong"] && location.lng > city["minLong"])
        return true;
    }
    return false;
  }

  Map<String, String> getUrl(double latitude, double longitude) {
    Location currentLocation = Location(lat: latitude, lng: longitude);

    //Compare for Manaus only
    if (compareCoordinates(currentLocation, _manausCoord))
      return _manausUrl;
    else
      throw new Exception("Invalid coordinates");
  }
}
