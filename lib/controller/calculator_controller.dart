import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/config/colors.dart';

class CalculatorController extends GetxController {
  RxString inputValue = "".obs; // Input pengguna
  RxDouble outputValue = 0.0.obs; // Hasil kalkulasi
  String expression = ""; // Ekspresi matematika
  Parser parser = Parser(); // Parser untuk ekspresi

  void onPressed(String btnName) {
    // Jika tombol "=" ditekan, kalkulasi hasil
    if (btnName == "=") {
      onResultPress();
    } else if (btnName == "C") {
      // Reset input dan output jika tombol "C" ditekan
      inputValue.value = "";
      outputValue.value = 0.0;
    } else {
      // Penanganan untuk tombol selain "=" dan "C"
      if (_isDuplicateDot(btnName)) {
        print("Invalid input: Duplicate dot.");
      } else {
        inputValue.value += btnName; // Tambahkan tombol ke input
      }
    }
  }

  void onResultPress() {
    try {
      // Ganti 'x' dengan '*' untuk operasi perkalian
      expression = inputValue.value.replaceAll("x", "*");

      // Parsing ekspresi matematika
      Expression exp = parser.parse(expression);

      // Evaluasi ekspresi dengan model konteks
      ContextModel contextModel = ContextModel();
      outputValue.value = exp.evaluate(EvaluationType.REAL, contextModel);
    } catch (e) {
      // Penanganan jika ekspresi tidak valid
      print("Error parsing expression: $e");
      outputValue.value = 0.0;
    }
  }

  // Fungsi untuk memeriksa duplikasi tanda desimal
  bool _isDuplicateDot(String btnName) {
    if (btnName == ".") {
      // Jika sudah ada "." dalam input saat ini, jangan tambahkan lagi
      return inputValue.value.contains(RegExp(r'[0-9]*\.[0-9]*$'));
    }
    return false;
  }
}
