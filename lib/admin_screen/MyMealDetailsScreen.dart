import 'package:flutter/material.dart';
import 'package:mess_erp/screens/login_screen.dart';
import 'package:mess_erp/screens/login_screen.dart';

class MyMealDetailsScreen extends StatelessWidget {
  const MyMealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),

      /// 🔵 APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2563EB),
        title: const Text("My Meal Details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: Open Drawer
            Navigator.pop(context);
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: const Text(
                    "2",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/150",
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔍 FILTER BAR
            Container(
              padding: const EdgeInsets.all(12),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  _filterButton(Icons.calendar_month, "April 2024"),
                  const SizedBox(width: 10),
                  _filterButton(Icons.restaurant, "All Meals"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Search"),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 📊 SUMMARY CARDS
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                _summaryCard("Total Meals", "24", Icons.restaurant, Colors.green),
                _summaryCard("Breakfast", "10", Icons.wb_sunny, Colors.orange),
                _summaryCard("Lunch", "8", Icons.ramen_dining, Colors.purple),
                _summaryCard("Dinner", "6", Icons.nightlight, Colors.red),
              ],
            ),

            const SizedBox(height: 20),

            /// 📋 DAILY MEAL RECORDS
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daily Meal Records",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            const SizedBox(height: 10),

            _mealTile("April 1, 2024", "Breakfast", "8:00 AM", "1.5 Units"),
            _mealTile("April 1, 2024", "Lunch", "1:00 PM", "2.0 Units"),
            _mealTile("April 1, 2024", "Dinner", "8:00 PM", "1.0 Units"),
            _mealTile("April 1, 2024", "Breakfast", "8:00 AM", "1.0 Units"),

            const SizedBox(height: 20),

            /// 💰 TOTAL
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total: 4.5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  Text(
                    "Total Cost: 180 BDT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// 🔻 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Meals"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Requests"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),


        ],
        onTap: (index) {
          if(index == 4)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            }
        },
      ),
    );
  }

  // ===================== WIDGETS =====================

  Widget _filterButton(IconData icon, String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 6),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mealTile(String date, String meal, String time, String unit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: _cardDecoration(),
      child: ListTile(
        leading: const Icon(Icons.calendar_month, color: Color(0xFF2563EB)),
        title: Text("$date\n$meal"),
        subtitle: Text(time),
        trailing: Text(
          unit,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 8,
        )
      ],
    );
  }
}
