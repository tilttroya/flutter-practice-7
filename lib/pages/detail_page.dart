
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final format = ModalRoute.of(context)!.settings.arguments
    as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(format['title'] ?? 'Формат'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  format['image']!,
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              Text(
                format['title'] ?? '',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                format['description'] ?? '',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
