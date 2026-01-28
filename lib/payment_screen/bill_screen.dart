import 'package:flutter/material.dart';
import 'package:mess_erp/payment_screen/make_payment.dart';

class MyBillScreen extends StatelessWidget {
  const MyBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),

      /// 🔵 AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF3559E0),
        title: const Text("My Bill"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // 🔮 Future: Notification screen
            },
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/user.png"), // optional
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 📅 Month + Total
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 8),
                      Text("April 2024",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Text(
                    "Total: 3,400 BDT",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// ⬇️ Download Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3559E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.download),
                label: const Text("Download Bill"),
                onPressed: () {
                  // 🔮 Future:
                  // Generate PDF & download
                },
              ),
            ),

            const SizedBox(height: 20),

            /// 🧾 Bill Breakdown
            _billItem(
              icon: Icons.restaurant,
              color: Colors.green,
              title: "Meal Charge",
              subtitle: "Total Meals: 90 (Rate: 10 BDT)",
              amount: "900 BDT",
            ),

            _billItem(
              icon: Icons.lightbulb,
              color: Colors.blue,
              title: "Utility Charge",
              subtitle: "Electricity + Gas + Water",
              amount: "800 BDT",
            ),

            _billItem(
              icon: Icons.home,
              color: Colors.orange,
              title: "Mess Rent",
              subtitle: "Monthly Mess Rent",
              amount: "1,200 BDT",
            ),

            _billItem(
              icon: Icons.receipt_long,
              color: Colors.purple,
              title: "Fixed / Base Charge",
              subtitle: "Additional Fixed Charges",
              amount: "500 BDT",
            ),

            const SizedBox(height: 16),

            /// 🔢 Final Total
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("3,400 BDT",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),

      /// 🔻 Bottom Navigation (like image)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xFF3559E0),
        unselectedItemColor: Colors.grey,
        onTap: (index) {

          if(index == 3)
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MakePaymentScreen() ));
            }
          // 🔮 Future:
          // 0 → Home
          // 1 → Meals
          // 2 → My Bill (current)
          // 3 → Settings
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Meals"),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), label: "My Bill"),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: "Payment"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),

        ],

      ),

    );
  }

  /// 🔹 Single Bill Card
  Widget _billItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style:
                    TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              ],
            ),
          ),
          Text(amount,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
