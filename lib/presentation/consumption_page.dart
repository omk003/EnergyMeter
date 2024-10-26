// consumption_page.dart
import 'package:flutter/material.dart';
import 'package:nineti/data/entity/consumption_entity.dart';
import 'package:provider/provider.dart';
import 'consumption_view_model.dart';
import 'package:intl/intl.dart';

class ConsumptionPage extends StatelessWidget {
  const ConsumptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stromleser',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 123, 241),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Consumer<ConsumptionViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(
                        255, 72, 123, 241), //Color.fromARGB(255, 197, 197, 197)
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      //Animation in work , need to implement the stateful widget
                      child: AnimatedContainer(
                        duration: const Duration(
                            seconds: 3), // Duration of the animation
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 72, 135, 241),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 4, // Border width
                          ),
                        ),
                        width: 200,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/energy_icon.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${viewModel.totalConsumption}',
                      style: const TextStyle(fontSize: 35),
                    ),
                    const Text(
                      'consumption',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Replace Container with SizedBox for whitespace
                    SizedBox(
                      width: 108,
                      child: ElevatedButton(
                        onPressed: () {
                          // Toggle or power button logic
                        },
                        child: const Icon(
                          Icons.power_settings_new,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const FilterSection(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  //itemCount: viewModel.consumptions.length,//will be use when database is there
                  itemCount: sampleConsumptions.length,
                  itemBuilder: (context, index) {
                    final consumption = sampleConsumptions[index];
                    return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        title: Text(DateFormat('dd MMM, yyyy')
                            .format(consumption.date)),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            '${consumption.value}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('  Consumed')
                        ]));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// FilterSection widget for day, month, year filters
class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: true,
          onChanged: (bool? value) {},
          activeColor: const Color.fromARGB(255, 72, 123, 241),
        ),
        const Text('Day'),
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
          activeColor: const Color.fromARGB(255, 72, 123, 241),
        ),
        const Text('Month'),
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
          activeColor: const Color.fromARGB(255, 72, 123, 241),
        ),
        const Text('Year'),
        const SizedBox(
          width: 30,
        ),
        IconButton(
          icon: const Icon(Icons.calendar_today), // Calendar icon
          onPressed: () {
            // Logic to open the calendar
            // You can use a date picker or any calendar widget here
          },
        ),
      ],
    );
  }
}

// Sample data for consumptions
final List<Consumption> sampleConsumptions = [
  Consumption(
      date: DateTime.now().subtract(const Duration(days: 1)), value: 150),
  Consumption(
      date: DateTime.now().subtract(const Duration(days: 2)), value: 200),
  Consumption(
      date: DateTime.now().subtract(const Duration(days: 3)), value: 175),
  Consumption(
      date: DateTime.now().subtract(const Duration(days: 4)), value: 220),
  Consumption(
      date: DateTime.now().subtract(const Duration(days: 5)), value: 180),
];
