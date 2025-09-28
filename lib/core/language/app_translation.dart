import 'package:get/get.dart';
import 'app_en.dart';
import 'app_vi.dart';


class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': vi,
  };
}
