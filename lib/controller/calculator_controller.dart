import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  RxString inputValue = "".obs; // Input pengguna
  RxDouble outputValue = 0.0.obs; // Hasil kalkulasi
  RxList<String> historyList = <String>[].obs; // Menyimpan history

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
      outputValue.value = exp.evaluate(EvaluationType.REAL, contextModel);

      // Simpan ekspresi dan hasilnya ke history
      String historyEntry = "${inputValue.value} = ${outputValue.value}";
      historyList.add(historyEntry);
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
}
