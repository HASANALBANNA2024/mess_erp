import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget
{
  const ForgotPassword({super.key});

  State<ForgotPassword> createState() => _ForgotPasswordState();

}
class _ForgotPasswordState extends State<ForgotPassword>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      //AppBar
      appBar: AppBar(
        toolbarHeight: 40,
          centerTitle: true,
          backgroundColor: const Color(0xFF0F172A),
        title: Text('Forgot Password', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
        // back arrow return back page
          leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white,),
        ),
      ),

      // body
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.location_city_rounded,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24,),

              // App Name
              const Text('Mess ERP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),


             const SizedBox(height: 20,),
              // Email ID
              TextField(
                decoration: InputDecoration(
                    labelText: 'Email ID',
                    hintText: 'Enter Your Registered Email ID',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),


              // Registered Phone Number
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Phone Number ',
                    hintText: 'Enter Your Registered Phone Number',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),

              // NID Verification
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: 'NID',
                    hintText: 'Enter Your Register NID',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),

              // Age Varification
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Birth Date ',
                    hintText: 'Enter Your Birth Date as per NID',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                ),
              ),


              // submit button
              const SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0F172A),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )

                  ),


                  onPressed: (){}, child: const Text("Submit", style: TextStyle(
                 color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16

              ),)),
              const SizedBox(height: 30,),

              const Text('Powered by Banna Innovative Software ltd',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12,
                    color: Colors.black),)








            ],
          ),
        ),
      )),


















    );
  }
}
