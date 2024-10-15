import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My App'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile)) {
            return const Center(
              child: Text('Mobile connected to Internet'),
            );
          } else if (snapshot.data!.contains(ConnectivityResult.wifi)) {
            return const Center(
              child: Text('Mobile connected to wifi'),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'Assets/Image/repeat-jump.gif',
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'Oops! No internet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // child: Text('No internet'),
            );
          }
        },
      ),
    );
  }
}