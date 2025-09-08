import 'package:flutter/material.dart';

class ChessScreen extends StatelessWidget {
  const ChessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                ],
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                  Container(color: Colors.amber.shade50, height: 50, width: 50),
                  Container(color: Colors.black, height: 50, width: 50),
                ],
              ),
            ),
            Text("Chess Board"),
          ],
        ),
      ),
    );
  }
}
