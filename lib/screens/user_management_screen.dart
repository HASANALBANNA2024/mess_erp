import 'package:flutter/material.dart';
import 'package:mess_erp/screens/add_user_screen.dart';
import 'package:mess_erp/screens/edit_screen.dart'; // Edit screen import
// 🔹 Future: Firebase/API import এখানে add হবে

// User model
class User {
  final String password;
  final String name;
  final String role;

  User({required this.password, required this.name, required this.role});
}

class UserManagementScreen extends StatelessWidget {
   UserManagementScreen({super.key});

  // 🔹 Future: Dynamic user list from API/Firebase
  final List<User> users = [
    User(password: "940911", name: "Bilal Chowke", role: "Manager"),
    User(password: "940912", name: "Hasan Hasan", role: "Admin"),
    User(password: "940913", name: "Reza Reza", role: "Member"),
    User(password: "940914", name: "Rubel Karim", role: "Member"),
    User(password: "940915", name: "Malik Nazir", role: "Member"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // 🔵 AppBar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User Management", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // ⬅️ Admin Dashboard
          },
        ),
      ),

      body: Column(
        children: [

          /// ➕ Add User Button
          Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.add, color: Colors.white,),
              label: const Text(
                "Add User",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddUserScreen())
                );
              },
            ),
          ),

          /// 👥 User List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return _userTile(
                  name: user.name,
                  role: user.role,
                  image: Icons.person_outline,
                  // 🔹 Centralized edit function
                  onEdit: () => editUser(context, user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Single User Tile (UI same as image)
  Widget _userTile({
    required String name,
    required String role,
    required IconData image,
    required VoidCallback onEdit,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [

          /// 👤 Avatar
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blue.shade100,
            child: Icon(image, color: Colors.blue.shade700),
          ),

          const SizedBox(width: 12),

          /// 👤 Name + Role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          /// ✏️ Edit Button
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: onEdit, // centralized function call
          ),

          // 🔮 Future:
          // Add delete / disable user option (long press / menu)
        ],
      ),
    );
  }

  /// 🔹 Centralized edit function
  void editUser(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditUserScreen(user: user),
      ),
    );
  }
}
