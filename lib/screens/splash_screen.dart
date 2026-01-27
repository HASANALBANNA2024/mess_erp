import 'package:flutter/material.dart';
import 'package:mess_erp/screens/login_screen.dart';

class SplashScreen  extends StatefulWidget
{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState()
  {
    super.initState();
    // future user
    // 1. user login ache kina check
    // token/ session valid check
    // need to screen call

    Future.delayed(const Duration(seconds: 2), ()
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()) );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Icon(
                Icons.location_city_rounded,
                size: 60,
                color: Color(0xFF0F172A),
              ),
            ),

            // App Name
            const SizedBox(height: 24,),
            const Text("Mess ERP",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
            ),

            const SizedBox(height: 8,),
            //Tagline
            const Text('Smart Mess Management System',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            ),

            const SizedBox(height: 40,),
            // Loading Indicator
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),

            // loading message
            const SizedBox(height: 10,),
            Text("Loading", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),),










          ],
        ),
      ),
    );
  }
}
