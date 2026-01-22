import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scube_app/widgets/weather_card.dart';

class WeatherCardCarousel extends StatefulWidget {
  const WeatherCardCarousel({super.key});

  @override
  State<WeatherCardCarousel> createState() => _WeatherCardCarouselState();
}

class _WeatherCardCarouselState extends State<WeatherCardCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _weatherData = [
    {
      'temp': '17°C',
      'wind': '26 MPH / NW',
      'irradiation': '15.20 w/m²',
      'gradient': [Color(0xFF8B5CF6), Color(0xFFA78BFA)], // Purple
      'icon': Icons.wb_sunny,
      'iconColor': Colors.amberAccent,
    },
    {
      'temp': '30°C',
      'wind': '26 MPH / NW',
      'irradiation': '15.20 w/m²',
      'gradient': [Color(0xFF8B5CF6), Color(0xFFA78BFA)], // Purple
      'icon': Icons.wb_sunny,
      'iconColor': Colors.amberAccent,
    },
    {
      'temp': '19°C',
      'wind': '26 MPH / NW',
      'irradiation': '15.20 w/m²',
      'gradient': [Color(0xFF8B5CF6), Color(0xFFA78BFA)], // Purple
      'icon': Icons.wb_cloudy,
      'iconColor': Colors.white70,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_currentPage < _weatherData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, 
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: _weatherData.length,
        itemBuilder: (context, index) {
          final data = _weatherData[index];
          return WeatherCard(
            temp: data['temp'],
            wind: data['wind'],
            irradiation: data['irradiation'],
            gradient: data['gradient'],
            weatherIcon: data['icon'],
            iconColor: data['iconColor'],
          );
        },
      ),
    );
  }
}
