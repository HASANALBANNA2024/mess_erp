import 'package:flutter/material.dart';

class MessAccountScreen extends StatelessWidget {
  const MessAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final TextEditingController accountNameController = TextEditingController();
    final TextEditingController accountNumberController = TextEditingController();

    String selectedPaymentType = "Cash"; // default selection

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔵 AppBar
      appBar: AppBar(
        title: const Text("Mess Account Setup",style: TextStyle(color: Colors.white, )),
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

            /// 💳 Payment Type Selection
            const Text(
              "Payment Type",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ChoiceChip(
                  label: const Text("Cash"),
                  selected: selectedPaymentType == "Cash",
                  onSelected: (selected) {
                    selectedPaymentType = "Cash";
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Bkash"),
                  selected: selectedPaymentType == "Bkash",
                  onSelected: (selected) {
                    selectedPaymentType = "Bkash";
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Nagad"),
                  selected: selectedPaymentType == "Nagad",
                  onSelected: (selected) {
                    selectedPaymentType = "Nagad";
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Upay"),
                  selected: selectedPaymentType == "Upay",
                  onSelected: (selected) {
                    selectedPaymentType = "Upay";
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 📝 Account Name
            TextField(
              controller: accountNameController,
              decoration: _inputDecoration("Account Name"),
            ),

            const SizedBox(height: 12),

            /// 📝 Account Number
            TextField(
              controller: accountNumberController,
              decoration: _inputDecoration("Account Number"),
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
                  // 🔮 Future:
                  // Save account info to database or API
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Mess account saved successfully!")),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save Account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ),
                ),

              ),

            ),
            //footer add
            const SizedBox(height: 30,),
            //footer text
             Center(
               child: const Text('Powered by Banna Innovative Software ltd',
                 textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 12,
                     color: Colors.black),),
             )
          ],
        ),
      ),
    );
  }

  /// Input Decoration for textfields
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
