import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add User", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xFF0F172A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _inputField("Full Name"),
            _inputField("User ID"),
            _inputField("Password", isPassword: true),

            const SizedBox(height: 16),

            /// 🔽 Role Dropdown
            DropdownButtonFormField<String>(
              decoration: _inputDecoration("Select Role"),
              items: const [
                DropdownMenuItem(value: "manager", child: Text("Manager")),
                DropdownMenuItem(value: "member", child: Text("Member")),
              ],
              onChanged: (value) {
                // 🔮 Future: store role value
              },
            ),

            const SizedBox(height: 24),

            /// ➕ Add Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                ),
                onPressed: () {
                  // 🔮 Future:
                  // 1. Form validation
                  // 2. API call to create user
                  // 3. Success → back to UserManagementScreen
                },
                child: const Text("Add User",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        obscureText: isPassword,
        decoration: _inputDecoration(label),
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
