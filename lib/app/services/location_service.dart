import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> getCityName() async {
  try {
    Position position = await _determinePosition();
    
    print("[DEBUG] Position: ${position.latitude}, ${position.longitude}");

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      
      print("[DEBUG] Placemark found: ${place.toJson()}");

      String? city = place.locality;
      if (city != null && city.isNotEmpty) {
        return city;
      }

      String? adminArea = place.administrativeArea;
      if (adminArea != null && adminArea.isNotEmpty) {
        return adminArea;
      }
      
      String? subAdminArea = place.subAdministrativeArea;
      if (subAdminArea != null && subAdminArea.isNotEmpty) {
        return subAdminArea;
      }

      String? street = place.street;
      if (street != null && street.isNotEmpty) {
        return street;
      }

      return "Unknown Location"; 
    } else {
      return "No Location Name Found";
    }
  } catch (e) {
    print("[DEBUG] Error in getCityName: ${e.toString()}");
    return "Error: ${e.toString()}";
  }
}
}