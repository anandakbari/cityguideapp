import '/core/app_export.dart';
import 'package:city_guide_app/presentation/popular_places_screen/models/popular_places_model.dart';

class PopularPlacesController extends GetxController {
  Rx<PopularPlacesModel> popularPlacesModelObj = PopularPlacesModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
