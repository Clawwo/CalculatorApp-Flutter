import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  RxString inputValue = "".obs; // Input pengguna
  RxDouble outputValue = 0.0.obs; // Hasil kalkulasi
  RxList<String> historyList = <String>[].obs; // Riwayat operasi
  String expression = ""; // Ekspresi matematika
  Parser parser = Parser(); // Parser untuk ekspresi

  void onPressed(String btnName) {
    if (btnName == "=") {
      onResultPress();
    } else if (btnName == "C") {
      inputValue.value = "";
      outputValue.value = 0.0;
    } else {
      if (_isDuplicateDot(btnName)) {
        print("Invalid input: Duplicate dot.");
      } else {
        inputValue.value += btnName;
      }
    }
  }

  void onResultPress() {
    try {
      expression = inputValue.value.replaceAll("x", "*");
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, contextModel);
      outputValue.value = result;

      // Tambahkan ke riwayat
      historyList.add("${inputValue.value} = $result");

      // Batasi riwayat agar tidak terlalu panjang
      if (historyList.length > 10) {
        historyList.removeAt(0);
      }
    } catch (e) {
      print("Error parsing expression: $e");
      outputValue.value = 0.0;
    }
  }

  bool _isDuplicateDot(String btnName) {
    if (btnName == ".") {
      return inputValue.value.contains(RegExp(r'[0-9]*\.[0-9]*$'));
    }
    return false;
  }

  void clearHistory() {
    historyList.clear();
  }
}
