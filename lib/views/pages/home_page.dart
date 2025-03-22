import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
                child: Center(
                  child: Text(
                    'Welcome to the Home Page',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 100.0,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Advertisement Banner',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Wrap(
                spacing: 30.0,
                runSpacing: 10.0,
                children: List.generate(4, (index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150.0, 50.0),
                    ),
                    onPressed: () {},
                    child: Text('Class ${index + 9}'),
                  );
                }),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Text('Need a Tutor?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
