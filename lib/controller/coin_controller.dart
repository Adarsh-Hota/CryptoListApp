import 'package:crypto_list_app/modals/coin_modal.dart';
import 'package:crypto_list_app/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController {
  RxBool isLoading = true.obs;
  var coinsList = <CoinModal>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
  }

  Future<void> fetchCoins() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse(apiEndpointUrl),
      );
      coinsList.value = coinModalFromJson(response.body);
    } finally {
      isLoading(false);
    }
  }
}
