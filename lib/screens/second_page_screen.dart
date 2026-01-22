import 'package:flutter/material.dart';
import 'package:scube_app/utils/colors.dart';
import 'package:scube_app/widgets/circular_power_chart.dart';
import 'package:scube_app/widgets/data_view_card.dart';
import 'package:scube_app/widgets/function_button.dart';

class SecondPageScreen extends StatefulWidget {
  const SecondPageScreen({super.key});

  @override
  State<SecondPageScreen> createState() => _SecondPageScreenState();
}

class _SecondPageScreenState extends State<SecondPageScreen> {
  bool isSourceSelected = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "2nd Page",
          style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
               IconButton(
                icon: const Icon(Icons.notifications_none, color: kTextColor, size: 28),
                onPressed: () {},
              ),
               Positioned(
                 top: 10,
                 right: 10,
                 child: Container(
                   width: 10, height: 10,
                   decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                 ),
               )
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Navigation Button to 1st Page
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "1st Page Navigate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ),
          ),

          // Tab Bar 
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildTab("Summery", true),
                const SizedBox(width: 8),
                _buildTab("SLD", false),
                const SizedBox(width: 8),
                _buildTab("Data", false),
              ],
            ),
          ),

          
          Expanded(
            child: _buildSummaryTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isActive) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : const Color(0xFFE8EEF2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey.shade500,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          
          
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFE0E8F0),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                // Electricity Label
                const Text(
                  "Electricity",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9E9E9E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
                const SizedBox(height: 16),

                // Circular Power Chart
                const CircularPowerChart(
                  power: "5.53 kw",
                  percentage: 0.75,
                ),
                const SizedBox(height: 20),

                
                Container(
                  width: 240,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F1F8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isSourceSelected = true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSourceSelected ? kPrimaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Source",
                                style: TextStyle(
                                  color: isSourceSelected ? Colors.white : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isSourceSelected = false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isSourceSelected ? kPrimaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Load",
                                style: TextStyle(
                                  color: !isSourceSelected ? Colors.white : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Data View Section 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DataViewCard(
                        title: "Data View",
                        status: "(Active)",
                        data1Label: "Data 1",
                        data1Value: "55505.63",
                        data2Label: "Data 2",
                        data2Value: "58805.63",
                        icon: Icons.solar_power,
                        iconColor: const Color(0xFF00BFFF),
                        onTap: () {},
                      ),
                      DataViewCard(
                        title: "Data Type 2",
                        status: "(Active)",
                        data1Label: "Data 1",
                        data1Value: "55505.63",
                        data2Label: "Data 2",
                        data2Value: "58805.63",
                        icon: Icons.battery_charging_full,
                        iconColor: Colors.orange,
                        onTap: () {},
                      ),
                      DataViewCard(
                        title: "Data Type 3",
                        status: "(Inactive)",
                        data1Label: "Data 1",
                        data1Value: "55505.63",
                        data2Label: "Data 2",
                        data2Value: "58805.63",
                        icon: Icons.electrical_services,
                        iconColor: const Color(0xFF00BFFF),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Vertical Scroll Indicator 
                Container(
                  width: 4,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        child: Container(
                          width: 4,
                          height: 60,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Function Buttons Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                FunctionButton(
                  imagePath: 'lib/assets/chart.png',
                  label: "Analysis Pro",
                  onTap: () {},
                ),
                FunctionButton(
                  imagePath: 'lib/assets/generator.png',
                  label: "G. Generator",
                  onTap: () {},
                ),
                FunctionButton(
                  imagePath: 'lib/assets/charge.png',
                  label: "Plant Summary",
                  onTap: () {},
                ),
                FunctionButton(
                  imagePath: 'lib/assets/fire.png',
                  label: "Natural Gas",
                  onTap: () {},
                ),
                FunctionButton(
                  imagePath: 'lib/assets/asset.png',
                  label: "D. Generator",
                  onTap: () {},
                ),
                FunctionButton(
                  imagePath: 'lib/assets/water.png',
                  label: "Water Process",
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}

