import 'package:flutter/material.dart';
import 'package:mess_erp/screens/create_mess_screen.dart';
import 'package:mess_erp/screens/user_management_screen.dart';

class AdminDashboard extends StatelessWidget
{
  const AdminDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      //appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Admin Dashboard", style: TextStyle(color: Colors.white, ),),
        backgroundColor: const Color(0xFF0F172A),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),

        actions: [
          Padding(padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.notifications, color: Colors.white,),),
        ],
      ),
      
      // body
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              // top summary cards
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // total mess card
                _summaryCard(title: "Total Mess", value: "172/2", icon: Icons.home, color: Colors.orange),
                // total member card
                _summaryCard(title: "Member", value: "20", icon: Icons.people, color: Colors.green),
                // pending card
                _summaryCard(title: "Pending", value: "3", icon: Icons.pending, color: Colors.red),



              ],
              
            ),

            const SizedBox(height: 20,),

            // create mess button
            _actionButton(text: "Create Mess", color: Colors.red, icon: Icons.add, onTap: (){
              // future navigator pust to create mess screen
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateMessScreen()));

            }),

            const SizedBox(height: 12,),
            //View Reports Button
            _actionButton(text: "View Reports", color: Colors.blue, icon: Icons.bar_chart, onTap: (){
              // future navigator push to Report screen

            },),

          ],
        ),
        
      ),

      //Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0F172A), // 👈 background color
        currentIndex: 0,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed, // important
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Users",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Expand",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Reports",
          ),
        ],
        // screen golo call kora hobe sob
        onTap: (index) {
          if(index == 1)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserManagementScreen()));
            }
        },
      ),










    );
  }
  
// summary card widget
Widget _summaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
})
{
  return Expanded(child: Container(
    margin:  const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05),
        blurRadius: 6)
      ]
    ),
    
    
    child: Column(
      children: [
        Icon(icon, color: color, size: 30,),
        const SizedBox(height: 8,),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        const SizedBox(height: 4,),
        Text(title, style: TextStyle(color: Colors.grey.shade600),)
      ],
    ),
    
  ));
}
  



// action Button Widget

Widget _actionButton({
    required String text,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
})
{
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white,),
          const SizedBox(width: 10,),
          Text(
            text, style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          )


        ],
      ),
    ),
  );

}

  
  
}