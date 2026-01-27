import 'package:flutter/material.dart';

class ManagerAssignmentScreen extends StatelessWidget {
  const ManagerAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Manager Assignment",style: TextStyle(color: Colors.white, )),
        backgroundColor: const Color(0xFF0F172A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 📅 Month Selector (future)
            DropdownButtonFormField<String>(
              decoration: _inputDecoration("Select Month"),
              items: const [
                DropdownMenuItem(value: "jan", child: Text("January")),
                DropdownMenuItem(value: "feb", child: Text("February")),
              ],
              onChanged: (value) {},
            ),

            const SizedBox(height: 12),

            /// 👤 Manager Selector
            DropdownButtonFormField<String>(
              decoration: _inputDecoration("Select Manager"),
              items: const [
                DropdownMenuItem(value: "1", child: Text("Bilal Chowke")),
                DropdownMenuItem(value: "2", child: Text("Hasan Hasan")),
              ],
              onChanged: (value) {},
            ),

            const SizedBox(height: 24),

            /// ✅ Assign Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                ),
                onPressed: () {
                  // 🔮 Future:
                  // Save manager assignment (month wise)
                  Navigator.pop(context);
                },
                child: const Text("Assign Manager",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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

