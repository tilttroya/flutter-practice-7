
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';
import '../models/image_format.dart';
import 'bloc/home_bloc.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _buildMainContent(List<ImageFormat> formats) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        final isDesktop = kIsWeb ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.linux;

        return ListView(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? 40 : 16,
            vertical: isDesktop ? 40 : 16,
          ),
          children: [
            const Text(
              'Форматы графических изображений',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Форматы изображений определяют способ хранения '
                  'графической информации. Они отличаются методами '
                  'сжатия, качеством, размером файла и поддержкой '
                  'прозрачности.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: formats.length,
                separatorBuilder: (context, index) =>
                const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      formats[index].imagePath,
                      width: 150,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: formats.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWide ? 2 : 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: isDesktop ? 24 : 12,
                mainAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                final format = formats[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.image_outlined,
                      color: Colors.blue,
                    ),
                    title: Text(
                      format.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(format.description),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.detail,
                        arguments: {
                          'title': format.name,
                          'description': format.fullDescription,
                          'image': format.imagePath,
                        },
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

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
        );
      },
    );
  }

  Widget _buildBlocContent() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return const Center(
            child: Text('Данные ещё не загружены'),
          );
        }

        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is HomeLoaded) {
          return _buildMainContent(state.formats);
        }

        if (state is HomeError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                      const LoadImageFormatsEvent(),
                    );
                  },
                  child: const Text('Повторить'),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
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

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildBlocContent(),
          const ProfilePage(),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.lightBlueAccent.shade100,
        indicatorColor: Colors.lightBlueAccent,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
