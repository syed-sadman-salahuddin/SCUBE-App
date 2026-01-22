import 'package:flutter/material.dart';

class DataViewCard extends StatelessWidget {
  final String title;
  final String status;
  final String data1Label;
  final String data1Value;
  final String data2Label;
  final String data2Value;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const DataViewCard({
    super.key,
    required this.title,
    required this.status,
    required this.data1Label,
    required this.data1Value,
    required this.data2Label,
    required this.data2Value,
    required this.icon,
    this.iconColor = Colors.blue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1E9FF), width: 1),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFE3F2FD),
            Colors.white.withOpacity(0.9),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Image.asset(
                  'lib/assets/solar_panel.png', 
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(icon, color: iconColor, size: 24),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: iconColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D3E50),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 10,
                              color: status.toLowerCase().contains('active')
                                  ? const Color(0xFF00BFFF)
                                  : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Text(
                            "Data 1",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7D8C9D),
                            ),
                          ),
                          const Text(
                            "  :  ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7D8C9D),
                            ),
                          ),
                          Text(
                            data1Value,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3E50),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Text(
                            "Data 2",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7D8C9D),
                            ),
                          ),
                          const Text(
                            "  :  ",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF7D8C9D),
                            ),
                          ),
                          Text(
                            data2Value,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3E50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
               
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF7D8C9D),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
