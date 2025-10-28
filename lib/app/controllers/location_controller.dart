import 'package:get/get.dart';
import 'package:assigment2/app/services/location_service.dart';

class LocationController extends GetxController {
  final LocationService _locationService = LocationService();

  // 'Rx' membuat variabel ini 'reactive'
  var isLoading = true.obs;
  var currentCity = "Loading...".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserLocation();
  }

  void fetchUserLocation() async {
    try {
      isLoading(true);
      String city = await _locationService.getCityName();
      // 'Medan' dari desain Anda akan diganti oleh hasil geolocator
      currentCity(city); 
    } catch (e) {
      currentCity("Location Error");
    } finally {
      isLoading(false);
    }
  }
}