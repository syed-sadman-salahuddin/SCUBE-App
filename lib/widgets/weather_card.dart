import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String temp;
  final String wind;
  final String irradiation;
  final List<Color>? gradient;
  final IconData? weatherIcon;
  final Color? iconColor;

  const WeatherCard({
    super.key,
    required this.temp,
    required this.wind,
    required this.irradiation,
    this.gradient,
    this.weatherIcon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: gradient ?? [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Temperature Section
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      temp,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.0),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Module\nTemperature",
                      style: TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                 // Thermometer Graphic
                SizedBox(
                  height: 60,
                  width: 24,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                     Container(
                       width: 12, 
                       height: 50, 
                       decoration: BoxDecoration(
                         color: Colors.white.withOpacity(0.3),
                         borderRadius: BorderRadius.circular(10)
                       ),
                      ),
                     Container(
                       width: 6, 
                       height: 35, 
                       decoration: BoxDecoration(
                         color: Colors.cyanAccent,
                         borderRadius: BorderRadius.circular(10)
                       ),
                      ),
                     Container(
                       width: 20, 
                       height: 20, 
                       decoration: BoxDecoration(
                         color: Colors.white,
                         shape: BoxShape.circle,
                         border: Border.all(color: Colors.white, width: 2)
                       ),
                       child: Center(
                         child: Container(
                           width: 14, height: 14,
                           decoration: const BoxDecoration(color: Colors.cyanAccent, shape: BoxShape.circle),
                         ),
                       ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         
          // Wind 
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: [
                        Expanded( 
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wind,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              const Text(
                                "Wind Speed & Direction",
                                style: TextStyle(fontSize: 10, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        irradiation,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const Text(
                        "Effective Irradiation",
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Icon(
              weatherIcon ?? Icons.wb_cloudy, 
              size: 48, 
              color: iconColor ?? Colors.amberAccent,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
