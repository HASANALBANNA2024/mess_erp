import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔵 AppBar
      appBar: AppBar(
        title: const Text("Reports", style: TextStyle(color: Colors.white),),
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

            /// 📊 Report Filters
            const Text(
              "Select Report Type",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filterButton(context, "Day"),
                _filterButton(context, "Week"),
                _filterButton(context, "Month"),
                _filterButton(context, "Year"),
              ],
            ),

            const SizedBox(height: 24),

            /// 📝 Report Details
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    _reportTile("Mess A", "Total Meals: 120", "Expense: 3500 BDT"),
                    _reportTile("Mess B", "Total Meals: 90", "Expense: 2800 BDT"),
                    _reportTile("Mess C", "Total Meals: 75", "Expense: 2100 BDT"),
                    _reportTile("Mess D", "Total Meals: 130", "Expense: 4000 BDT"),
                    // 🔮 Future: dynamic data from API/Firebase
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Filter button widget
  Widget _filterButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {
        // 🔮 Future: fetch report for the selected period
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$label report selected"))
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(label),
    );
  }

  /// Single report tile widget
  Widget _reportTile(String messName, String meals, String expense) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(messName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(meals),
          Text(expense),
        ],
      ),
    );
  }
}
