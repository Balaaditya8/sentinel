import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PressureGauge extends StatelessWidget {
  final double pressure;
  final bool isPatientView;

  PressureGauge({required this.pressure, this.isPatientView = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double gaugeSize = constraints.maxHeight * 0.8; // Adjust this factor as needed
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: gaugeSize,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 70,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 10,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 10,
                        endValue: 40,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 40,
                        endValue: 50,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 50,
                        endValue: 70,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: pressure,
                        needleColor: Colors.black,
                        tailStyle: TailStyle(length: 0.18, width: 8),
                        needleLength: 0.95,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '${pressure.toStringAsFixed(1)}',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isPatientView) Flexible(child: _buildMessageBox()),
          ],
        );
      },
    );
  }

  Widget _buildMessageBox() {
    String message;
    Color color;

    if (pressure < 10) {
      message = 'Warning: Pressure below 10. Please contact your doctor.';
      color = Colors.red;
    } else if (pressure <= 40) {
      message = 'Cervical pressure is in a normal range. Keep monitoring.';
      color = Colors.green;
    } else if (pressure <= 50) {
      message = 'Cervical pressure is above normal. Consult your doctor if you have concerns.';
      color = Colors.green;
    } else {
      message = 'Warning: Pressure above 50. Please contact your doctor.';
      color = Colors.orange;
    }

    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}