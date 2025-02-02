import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bmi_p.dart';
import 'bmi_r.dart';

class BmiPage extends StatelessWidget {
  BmiPage({super.key});

  @override
  Widget build(BuildContext context) {
    BmiProvider bmiObject = Provider.of<BmiProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: const Color(0xFF111328),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Color(0xFF111328),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bmiObject.buttonPress('male');
                      },
                      onDoubleTap: () {
                        bmiObject.restType();
                      },
                      child: Consumer<BmiProvider>(
                        builder: (context, value, Widget? child) => Container(
                          decoration: BoxDecoration(
                            color:
                            value.isMale ? Colors.blue : Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: 80, color: Colors.white),
                              SizedBox(height: 15),
                              Text('Male',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bmiObject.buttonPress("female");
                      },
                      onDoubleTap: () {
                        bmiObject.restType();
                      },
                      child: Consumer(
                        builder: (BuildContext context, BmiProvider value,
                            Widget? child) =>
                            Container(
                              decoration: BoxDecoration(
                                color:
                                value.isFemale ? Colors.pink : Colors.grey[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.female, size: 80, color: Colors.white),
                                  SizedBox(height: 15),
                                  Text('Female',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                ],
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Height Slider
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<BmiProvider>(
                          builder:

                              (BuildContext context, value, Widget? child) =>
                              Text('${value.height.round()}',
                                  style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                        ),
                        const Text(' cm',
                            style:
                            TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                    Consumer<BmiProvider>(
                      builder: (context, obj, child) => Slider(
                        value: obj.height,
                        min: 100,
                        max: 251,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.grey,
                        onChanged: (double value) {
                          obj.changeSlider(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Weight and Age Counters
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Consumer<BmiProvider>(
                            builder: (BuildContext context, BmiProvider value,
                                Widget? child) =>
                                Text(
                                  '${value.weight}',
                                  style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: 'weight--',
                                  backgroundColor: Colors.grey[600],
                                  child: const Icon(Icons.remove,
                                      color: Colors.white),
                                  onPressed: () {
                                    bmiObject.removeValue('weight');
                                  }),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                backgroundColor: Colors.grey[600],
                                child:
                                const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  bmiObject.addValue('weight');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Consumer<BmiProvider>(
                            builder: (BuildContext context, BmiProvider value,
                                Widget? child) =>
                                Text(
                                  '${value.age}',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: 'Age--',
                                  backgroundColor: Colors.grey[600],
                                  child: const Icon(Icons.remove,
                                      color: Colors.white),
                                  onPressed: () {
                                    bmiObject.removeage('Age');
                                  }),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                backgroundColor: Colors.grey[600],
                                child:
                                const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  bmiObject.addage('Age');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Calculate Button
            GestureDetector(
              onTap: () {
                double bmi =bmiObject.weight  / (bmiObject.height / 100 * bmiObject.height / 100);
                String resultText;
                if (bmi < 18.5) {
                  resultText = 'Underweight';
                } else if (bmi >= 18.5 && bmi < 24.9) {
                  resultText = 'Normal';
                } else if (bmi >= 25 && bmi < 29.9) {
                  resultText = 'Overweight';
                } else {
                  resultText = 'Obese';
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResultPage(
                      bmi: bmi,
                      resultText: resultText,
                      interpretation:
                      'You have a ${resultText.toLowerCase()} body weight.',
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
