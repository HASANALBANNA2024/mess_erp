import 'package:flutter/material.dart';
import 'user_management_screen.dart'; // User model import

class EditUserScreen extends StatelessWidget {
  final User user; // ✅ receive user object

  const EditUserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Controllers with pre-filled data
    final TextEditingController nameController = TextEditingController(text: user.name);
    final TextEditingController passwordController = TextEditingController(text: user.password);

    String selectedRole = user.role; // pre-selected role

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔵 AppBar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit User", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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

            /// 🧾 Name Field
            TextField(
              controller: nameController,
              decoration: _inputDecoration("Full Name"),
            ),

            const SizedBox(height: 12),

            /// 🆔 User ID (read-only)
            TextField(
              controller: passwordController,
              enabled: false, // ❌ User ID change করা যাবে না
              decoration: _inputDecoration("User ID"),
            ),

            const SizedBox(height: 12),

            /// 🎯 Role Dropdown
            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: _inputDecoration("Role"),
              items: const [
                DropdownMenuItem(value: "Manager", child: Text("Manager")),
                DropdownMenuItem(value: "Member", child: Text("Member")),
                DropdownMenuItem(value: "Admin", child: Text("Admin")),
              ],
              onChanged: (value) {
                if (value != null) selectedRole = value;
              },
            ),

            const SizedBox(height: 24),

            /// 💾 Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  // 🔮 Future:
                  // Update user info via API / Database
                  // Name = nameController.text
                  // Role = selectedRole
                  Navigator.pop(context); // temporarily just go back
                },
                child: const Text("Save Changes",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Input Decoration (same UI as before)
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
