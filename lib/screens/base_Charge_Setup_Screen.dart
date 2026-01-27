import 'package:flutter/material.dart';

class BaseChargeSetupScreen extends StatelessWidget {
  const BaseChargeSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final TextEditingController baseChargeController = TextEditingController();
    final TextEditingController extraChargeController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔵 AppBar
      appBar: AppBar(
        title: const Text("Base / Fixed Charge Setup",style: TextStyle(color: Colors.white54,
            fontWeight: FontWeight.bold ),),
        backgroundColor: const Color(0xFF0F172A),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 💰 Base Charge
            const Text(
              "Base Charge (per member)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: baseChargeController,
              decoration: _inputDecoration("Enter base charge"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            /// 🛒 Extra Charge
            const Text(
              "Extra Charge (optional)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: extraChargeController,
              decoration: _inputDecoration("Enter extra charge"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),

            /// 💾 Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // 🔮 Future: save base/extra charge to database

                 ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("Base charge saved successfully!"),)
                 );
                 Navigator.pop(context);
                },
                child: const Text(
                  "Save Charges",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Input Decoration for TextFields
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
