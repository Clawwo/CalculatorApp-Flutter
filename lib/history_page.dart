import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculator_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorController calculatorController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => calculatorController.historyList.isEmpty
              ? const Center(
                  child: Text(
                    "Belum ada history",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )
              : ListView.builder(
                  itemCount: calculatorController.historyList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        title: Text(
                          calculatorController.historyList[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            calculatorController.historyList.removeAt(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
