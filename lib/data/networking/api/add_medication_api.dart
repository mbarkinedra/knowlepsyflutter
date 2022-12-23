import '../../../app/config/app_settings.dart';
import '../json/abstract__json_resource.dart';
import '../json/add_state_medecation.dart';
import '../json/get_medication_json.dart';
import '../json/get_modif_medecation_json.dart';
import '../json/medecation_json.dart';
import '../json/update_medecation_json.dart';
import 'api_mager.dart';

class AddMedicationApi extends ApiManager {
  @override
  AbstractJsonResource fromJson(data) {
    return AddMedicationJson.fromJson(data);
  }

  @override
  String apiUrl() {
    return SettingsApp.addMedications;
  }
}

class GetMedicationApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.getMedecation + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetMedecationJson.fromJson(data);
  }
}

class GetModifMedicationApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.getModifMedecation + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetModifMedecationsJson.fromJson(data);
  }
}

class AddStateMedecation extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.addStateMedications + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AddStateMedicationJson.fromJson(data);
  }
}

class UpdateMedecationApi extends ApiManager {
  String id = "";

  @override
  String apiUrl() {
    return SettingsApp.updateMedications + id;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return UpdateMedecationsJson.fromJson(data);
  }
}
