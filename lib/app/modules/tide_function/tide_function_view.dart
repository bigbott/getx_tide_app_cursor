import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'tide_function_controller.dart';

class TideFunctionView extends GetView<TideFunctionController> {
  const TideFunctionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tide Chart')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      labelText: 'Enter City Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    controller.fetchTideData(controller.textController.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
            SizedBox(height: 24),
            GetBuilder<TideFunctionController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                
                if (controller.error.isNotEmpty) {
                  return Center(child: Text(controller.error));
                }

                if (controller.tideData.isEmpty) {
                  return Center(child: Text('No data available'));
                }

                return SizedBox(
                  height: 300,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: controller.tideData.asMap().entries.map((entry) {
                            return FlSpot(
                              entry.key.toDouble(),
                              entry.value['height'].toDouble(),
                            );
                          }).toList(),
                          isCurved: true,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
