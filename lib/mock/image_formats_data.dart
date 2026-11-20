
import '../models/image_format.dart';

const List<ImageFormat> imageFormats = [
  ImageFormat(
    name: 'JPEG',
    description: 'Формат сжатия фотографий',
    fullDescription:
    'JPEG — популярный растровый формат изображений. '
        'Использует сжатие с потерями, благодаря чему '
        'файлы занимают меньше места. '
        'Часто применяется для хранения фотографий.',
    imagePath: 'assets/images/jpeg.jpg',
  ),
  ImageFormat(
    name: 'PNG',
    description: 'Формат с поддержкой прозрачности',
    fullDescription:
    'PNG — растровый формат изображений, '
        'использующий сжатие без потерь. '
        'Поддерживает прозрачность и часто применяется '
        'для логотипов, иконок и графики.',
    imagePath: 'assets/images/png.jpg',
  ),
  ImageFormat(
    name: 'GIF',
    description: 'Формат для простой анимации',
    fullDescription:
    'GIF — растровый формат, поддерживающий '
        'анимацию и до 256 цветов в одном кадре. '
        'Часто используется для коротких '
        'анимированных изображений.',
    imagePath: 'assets/images/gif.jpeg',
  ),
  ImageFormat(
    name: 'SVG',
    description: 'Векторный формат изображений',
    fullDescription:
    'SVG — векторный формат на основе XML. '
        'Изображения SVG можно масштабировать '
        'без потери качества. '
        'Применяется для иконок, схем и логотипов.',
    imagePath: 'assets/images/svg.jpeg',
  ),
  ImageFormat(
    name: 'WebP',
    description: 'Современный формат для веб-графики',
    fullDescription:
    'WebP — современный формат изображений, '
        'разработанный Google. Поддерживает сжатие '
        'с потерями и без потерь, прозрачность '
        'и анимацию.',
    imagePath: 'assets/images/webp.jpeg',
  ),
];
