import 'package:flutter/material.dart';
import 'package:scube_app/utils/colors.dart';
import 'package:scube_app/widgets/info_card.dart';
import 'package:scube_app/widgets/weather_card_carousel.dart';
import 'package:scube_app/widgets/comparison_table.dart';
import 'package:scube_app/widgets/inverter_card.dart';
import 'package:scube_app/screens/second_page_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF2F6), 
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
          "1st Page",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 18),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            // Navigation Button
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPageScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
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
                      "2nd Page Navigate",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Top Grid 
             // Row 1
            Row(
              children: const [
                Expanded(child: InfoCard(title: "", value: "10000 kW", subTitle: "Live AC Power", icon: Icons.bolt, iconColor: Colors.green)),
                SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "82.58 %", subTitle: "Plant Generation", icon: Icons.settings, iconColor: Colors.cyan)),
                SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "85.61 %", subTitle: "Live PR", icon: Icons.donut_large, iconColor: Colors.purple)),
              ],
            ),
            const SizedBox(height: 10),
            // Row 2
            Row(
              children: const [
                Expanded(child: InfoCard(title: "", value: "27.58 %", subTitle: "Cumulative PR", icon: Icons.speed, iconColor: Colors.blue)),
                SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "10000 ৳", subTitle: "Return PV(Tk Total)", icon: Icons.currency_bitcoin, iconColor: Colors.orange)), // Bitcoin icon as placeholder for currency
                SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "10000 kWh", subTitle: "Total Energy", icon: Icons.grid_view, iconColor: Colors.pinkAccent)),
              ],
            ),
            
        
            const WeatherCardCarousel(),

            // Comparison Table
            DataComparisonTable(
              rows: [
                ComparisonRowData("AC Max Power", "1636.50 kW", "2121.88 kW"),
                ComparisonRowData("Net Energy", "6439.16 kWh", "4875.77 kWh"),
                ComparisonRowData("Specific Yield", "1.25 kWh/kWp", "0.94 kWh/kWp"),
                ComparisonRowData("Net Energy", "6439.16 kWh", "4875.77 kWh"), 
                ComparisonRowData("Specific Yield", "1.25 kWh/kWp", "0.94 kWh/kWp"),
              ],
            ),

            const SizedBox(height: 16),
            
            // Bottom Specs Module Count
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                     padding: const EdgeInsets.all(6), 
                     decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                     child: const Icon(Icons.solar_power_outlined, color: Colors.blue, size: 20)
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: const TextSpan(
                        style: TextStyle(color: kTextColor, fontSize: 13),
                        children: [
                          TextSpan(text: "Total Num of PV Module : ", style: TextStyle(color: Colors.grey)),
                          TextSpan(text: " 6372 pos. (585 Wp each)", style: TextStyle(fontWeight: FontWeight.bold)),
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),

             // Additional Spec Cards Grid
            Row(
              children: [
                Expanded(child: InfoCard(title: "", value: "3000 KW", subTitle: "Total AC Capacity", icon: Icons.electrical_services, iconColor: Colors.blue)),
                const SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "3.727 MWp", subTitle: "Total DC Capacity", icon: Icons.solar_power, iconColor: Colors.blue)),
              ],
            ),
            const SizedBox(height: 10),
             Row(
              children: [
                Expanded(child: InfoCard(title: "", value: "17/07/2024", subTitle: "Date of Commissioning", icon: Icons.calendar_today, iconColor: Colors.blue)),
                const SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "30", subTitle: "Number of Inverter", icon: Icons.power, iconColor: Colors.blue)),
              ],
            ),
             const SizedBox(height: 10),
             Row(
              children: [
                Expanded(child: InfoCard(title: "", value: "3000 KW", subTitle: "Total AC Capacity", icon: Icons.electrical_services, iconColor: Colors.blue)),
                const SizedBox(width: 10),
                Expanded(child: InfoCard(title: "", value: "3.727 MWp", subTitle: "Total DC Capacity", icon: Icons.solar_power, iconColor: Colors.blue)),
              ],
            ),
            
            const SizedBox(height: 20),

            // Inverter List 
            const InverterCard(
              title: "LT_01",
              powerRating: "495.505 kWp / 440 kW",
              lifetimeEnergy: "352.96 MWh",
              todayEnergy: "273.69 kWh",
              prevMeterEnergy: "0.00 MWh",
              livePower: "352.96 MWh",
            ),
             const InverterCard(
              title: "LT_01",
               powerRating: "495.505 kWp / 440 kW",
              lifetimeEnergy: "352.96 MWh",
              todayEnergy: "273.69 kWh",
              prevMeterEnergy: "0.00 MWh",
              livePower: "352.96 MWh",
            ),
          ],
        ),
      ),
    );
  }
}
