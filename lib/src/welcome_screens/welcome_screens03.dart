import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreenView03 extends StatelessWidget {
  const WelcomeScreenView03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text('Have access anywhere!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 156, 194, 225),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.all(15),
                  width: 20,
                  height: 15,
                  child: const Divider(),
                ),
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 156, 194, 225),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.all(15),
                  width: 20,
                  height: 15,
                  child: const Divider(),
                ),
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 6, 123, 219),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: const EdgeInsets.all(15),
                  width: 40,
                  child: const Divider(),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 80, right: 80),
              child: const Text(
                'Reach your financial goal within your first year!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 30),
              height: 320,
              width: 300,
              child: Lottie.asset('assets/wellcome03.json')),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/homescreen');
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
