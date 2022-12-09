import '../../../app/config/app_settings.dart';
import '../json/abstract__json_resource.dart';
import '../json/get_medication_json.dart';
import '../json/medecation_json.dart';
import 'api_mager.dart';

class AddMedicationApi extends ApiManager {
  @override
  AbstractJsonResource fromJson(data) {
    return AddMedicationJson.fromJson(data);
  }

  @override
  String apiUrl( ) {
    return SettingsApp.addMedications;
  }


}
class GetMedicationApi extends ApiManager {
  @override
  AbstractJsonResource fromJson(data) {
    return GetMedecationJson.fromJson(data);
  }

  @override
  String apiUrl( ) {
    return SettingsApp.getMedecation;
  }


}
