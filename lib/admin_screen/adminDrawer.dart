import 'package:flutter/material.dart';
import 'package:mess_erp/screens/login_screen.dart';
import 'package:mess_erp/screens/user_management_screen.dart';
import 'package:mess_erp/admin_screen//manager_assignment_screen.dart';
import 'package:mess_erp/admin_screen//mess_account_screen.dart';
import 'package:mess_erp/screens/base_Charge_Setup_Screen.dart';

Widget adminDrawer(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Admin Name"),
          accountEmail: const Text("admin@mess.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.blue.shade700),
          ),
          decoration: BoxDecoration(color: Colors.blue.shade700),
        ),

        // Dashboard
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text("Dashboard"),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        // User Management
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text("User Management"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (_) =>  UserManagementScreen())
            );
          },
        ),

        // Manager Assignment
        ListTile(
          leading: const Icon(Icons.assignment_ind),
          title: const Text("Manager Assignment"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ManagerAssignmentScreen())
            );
          },
        ),

        // Advance payment (charge)
        ListTile(
          leading: const Icon(Icons.assignment_ind),
          title: const Text("Advance Payment Setup"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BaseChargeSetupScreen())
            );
          },
        ),

        // Mess Account
        ListTile(
          leading: const Icon(Icons.account_balance_wallet),
          title: const Text("Mess Account"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const MessAccountScreen())
            );
          },
        ),

        // Settings
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          // onTap: () {
          //   Navigator.pop(context);
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (_) => const MessAccountScreen())
          //   );
          // },
        ),

        // Create Mess
        // ListTile(
        //   leading: const Icon(Icons.add_home),
        //   title: const Text("Create Mess"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (_) => const CreateMessScreen())
        //     );
        //   },
        // ),

        const Divider(),

        // Logout
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            // 🔮 Future: Logout function
          },
        ),
      ],
    ),
  );
}
