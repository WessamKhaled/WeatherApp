
import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "There is no weather 😔 start ",
                style: TextStyle(color: Colors.black,
                  fontSize: 26,
                ),
              ),

              Text(
                "searching now 🔎 ",
                style: TextStyle(color: Colors.black,
                  fontSize: 26,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
