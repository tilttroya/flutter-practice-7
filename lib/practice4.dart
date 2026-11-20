
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageFormatsPage(),
    );
  }
}

class ImageFormatsPage extends StatefulWidget {
  const ImageFormatsPage({super.key});

  @override
  State<ImageFormatsPage> createState() => _ImageFormatsPageState();
}

class _ImageFormatsPageState extends State<ImageFormatsPage> {
  final List<String> images = [
    'assets/images/jpeg.jpg',
    'assets/images/png.jpg',
    'assets/images/gif.jpeg',
    'assets/images/svg.jpeg',
    'assets/images/webp.jpeg',
  ];

  final List<Map<String, String>> formats = [
    {
      'title': 'JPEG',
      'description': 'Формат для фотографий, сжатие с потерями',
    },
    {
      'title': 'PNG',
      'description': 'Сжатие без потерь и поддержка прозрачности',
    },
    {
      'title': 'GIF',
      'description': 'Поддержка простой анимации',
    },
    {
      'title': 'SVG',
      'description': 'Векторная графика без потери качества',
    },
    {
      'title': 'WebP',
      'description': 'Современный формат с эффективным сжатием',
    },
  ];

  void showFormatSnackBar(String title) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Выбран формат: $title'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ФОРМАТЫ ИЗОБРАЖЕНИЙ',
          style: TextStyle(
            fontFamily: 'RussoOne',
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1 БЛОК: Название темы
            const Text(
              'Форматы графических изображений',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // 2 БЛОК: Описание
            const Text(
              'Форматы изображений определяют способ хранения '
                  'графической информации. Они отличаются методами '
                  'сжатия, качеством, размером файла и поддержкой '
                  'прозрачности.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 16),

            // 3 БЛОК: Горизонтальный список изображений
            SizedBox(
              height: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (context, index) =>
                const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      images[index],
                      width: 150,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // 4 БЛОК: Вертикальный список форматов
            Expanded(
              child: ListView.builder(
                itemCount: formats.length,
                itemBuilder: (context, index) {
                  final format = formats[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(
                        Icons.image_outlined,
                        color: Colors.blue,
                      ),
                      title: Text(
                        format['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(format['description']!),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onTap: () {
                        showFormatSnackBar(format['title']!);
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 5 БЛОК: Информация о студенте
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    size: 32,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Text(
                      'ФИО: Мицкевич Семён Александрович\n'
                          'Группа: ИКБО-63-23',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




