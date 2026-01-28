import 'package:flutter/material.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  // Controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Payment method selection
  String selectedPaymentMethod = "Bkash"; // default

  // Amounts (future: fetch from database/API)
  double mealAmount = 1200;
  double utilityAmount = 300;
  double messRent = 500;
  double fixedCharge = 200;

  @override
  Widget build(BuildContext context) {
    double totalAmount = mealAmount + utilityAmount + messRent + fixedCharge;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true, // ✅ keyboard safe

      appBar: AppBar(
        title: const Text("Make Payment", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF0F172A),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView( // ✅ scroll enabled
        padding: const EdgeInsets.fromLTRB(
          16,
          16,
          16,
          100, // ✅ bottom nav overlap fix
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 💳 Payment Method
            const Text(
              "Select Payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                ChoiceChip(
                  label: const Text("Bkash"),
                  selected: selectedPaymentMethod == "Bkash",
                  onSelected: (_) {
                    setState(() => selectedPaymentMethod = "Bkash");
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Nagad"),
                  selected: selectedPaymentMethod == "Nagad",
                  onSelected: (_) {
                    setState(() => selectedPaymentMethod = "Nagad");
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("DBBL"),
                  selected: selectedPaymentMethod == "DBBL",
                  onSelected: (_) {
                    setState(() => selectedPaymentMethod = "DBBL");
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 🧾 Amount cards
            _amountCard("Meal Amount", mealAmount),
            _amountCard("Utility Amount", utilityAmount),
            _amountCard("Mess Rent", messRent),
            _amountCard("Fixed Charge", fixedCharge),

            const SizedBox(height: 16),
            const Divider(thickness: 1.2),

            /// 💰 Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Tk $totalAmount",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 📝 User fields
            TextField(
              controller: fullNameController,
              decoration: _inputDecoration("Full Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              decoration: _inputDecoration("Phone Number"),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 24),

            /// 💳 Pay Button
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Payment submitted successfully!"),
                    ),
                  );
                },
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  /// Single amount display card
  Widget _amountCard(String title, double amount) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text("Tk $amount", style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// Input decoration for text fields
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
