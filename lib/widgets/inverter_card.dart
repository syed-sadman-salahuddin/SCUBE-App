import 'package:flutter/material.dart';
import 'package:scube_app/utils/colors.dart';

class InverterCard extends StatelessWidget {
  final String title;
  final String powerRating;
  final String lifetimeEnergy;
  final String todayEnergy;
  final String prevMeterEnergy;
  final String livePower;

  const InverterCard({
    super.key,
    required this.title,
    required this.powerRating,
    required this.lifetimeEnergy,
    required this.todayEnergy,
    required this.prevMeterEnergy,
    required this.livePower,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.wb_sunny_outlined, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      powerRating,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Content Grid
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailItem(
                        Icons.bolt,
                        Colors.cyan,
                        lifetimeEnergy,
                        "Lifetime Energy",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDetailItem(
                        Icons.hourglass_bottom,
                        Colors.amber,
                        todayEnergy,
                        "Today Energy",
                      ),
                    ),
                  ],
                ),
                 const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailItem(
                        Icons.swap_horiz,
                        Colors.orange,
                        prevMeterEnergy,
                        "Prev. Meter Energy",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDetailItem(
                        Icons.vertical_align_bottom,
                        Colors.deepPurpleAccent,
                        livePower,
                        "Live Power",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, Color color, String value, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
