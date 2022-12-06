import 'package:flutter/material.dart';
import 'package:zaki/screens/vocher_form.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const VoucherForm()),
              (Route<dynamic> route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Text("General ledger"),
        ),
      ),
    );
  }
}
