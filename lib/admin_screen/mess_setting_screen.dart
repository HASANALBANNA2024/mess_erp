import 'package:flutter/material.dart';

class MessSettingScreen extends StatefulWidget
{
  @override
  const MessSettingScreen({super.key});
  State<MessSettingScreen> createState() => _MessSettingScreenState();
}

class _MessSettingScreenState extends State<MessSettingScreen>
{
  bool fixedCharge = true;
  bool baseRent = true;
  bool utilitySettings = true;
  bool bKashEnabled = true;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mess Settings"),
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(onPressed: (){
          // back call
          Navigator.pop(context); // admin dashboard callback
        }, icon: Icon(Icons.arrow_back) ),
      ),


      // Body
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          //Fixed Charge
          _settingsTile(icon: Icons.attach_money,
              title: "Fixed Charge",
              value: fixedCharge,
              onChanged:(val){
                setState(()=> fixedCharge = val);

                //future
                // Save fixed charge enable/ disable to database
              }, ),

          // Base Rent
          _settingsTile(
              icon: Icons.home_work,
              title: "Base Rent",
              value: baseRent,
              onChanged: (val)
              {
                setState(() => baseRent = val);
                //future
                // base rent calculation enable
              }
          ),

          // Utility Settings
          _settingsTile(  icon: Icons.flash_on,
            title: "Utility Settings",
            value: utilitySettings,
            onChanged: (val) {
              setState(() => utilitySettings = val);

              // 🔮 Future:
              // Electricity / Water / Gas calculation
            },

          ),

          // Bkash Payment

_settingsTile( icon: Icons.account_balance_wallet,
  title: "bKash Account",
  value: bKashEnabled,
  onChanged: (val) {
    setState(() => bKashEnabled = val);

    // 🔮 Future:
    // Payment method enable / disable
  },

),

          const SizedBox(height: 20,),
          // bkash number card

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.phone, color: Colors.white,),
                SizedBox(width: 10,),
                Text(
                  "+88013369-13528",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w600),
                ),
              ],

            ),
            // future
            // tap on edit bkash number screen
          ),













        ],
      ),








    );
  }
  // Reuse Widget for public use for screen
   Widget _settingsTile({
    required IconData icon,
     required String title,
     required bool value,
     required Function(bool) onChanged,
})
   {
     return Container(
       margin:  const EdgeInsets.only(bottom: 12),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadiusGeometry.circular(12),
       ),
       child: SwitchListTile(
           secondary: Icon(icon, color: Colors.blue.shade700,),
           title: Text(title, style: TextStyle(fontWeight: FontWeight.w500),),
           value: value,
           activeColor:Colors.green, onChanged: onChanged),

     );
   }


}

