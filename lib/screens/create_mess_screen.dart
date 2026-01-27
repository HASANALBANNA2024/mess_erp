import 'package:flutter/material.dart';
import 'package:mess_erp/admin_screen/mess_setting_screen.dart';


class CreateMessScreen extends StatelessWidget
{
  const CreateMessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
      
       appBar: AppBar(
         centerTitle: true,
         title:  const Text("Create Mess", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
         backgroundColor: Colors.blue.shade700,
         leading: IconButton(onPressed: (){
           Navigator.pop(context);
         }, icon: const Icon(Icons.arrow_back)),
       ),



      body: Padding
      (
       padding: const EdgeInsets.all(16),
       child: Column(
         children: [
           // Mess Name Field
           _inputField(
               label: "Mess Name",
               hint: "Enter Mess Name",
               icon: Icons.home),

           const SizedBox(height: 14),

           // Address Field
           _inputField(
               label: "Address",
               hint: "Enter Mess Address",
               icon: Icons.location_on),

           const SizedBox(height: 30),

           // create Mess Button
           SizedBox
           (
             width: double.infinity,
             height: 50,
             child:  ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue.shade700,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadiusGeometry.circular(10),
                   )
                 ),
                 //function
                 onPressed: (){

                   Navigator.push(context, MaterialPageRoute(builder: (context)=> MessSettingScreen()));
               // Future use
               // From Validation
               // Api Call / database a mess save
               // success hole admin dashboard
             },
                 child: const Text('Create Mess',
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w600,color: Colors.white,
                 ),)),
           )









         ],
       ),
      ),
      







    );

  }


  // Reusable Input Field Widget
  Widget _inputField
  ({

    required String label,
    required String hint,
    required IconData icon,

  })
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(label,style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),),
        const SizedBox(height: 6,),

        TextField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            filled:  true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )
          ),
        )


      ],


    );

  }





}