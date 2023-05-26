import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// [syncfusion_flutter_sliders](https://pub.dev/packages/syncfusion_flutter_sliders)

class SampleSyncfusionSlider extends StatefulWidget {
  const SampleSyncfusionSlider({Key? key}) : super(key: key);

  @override
  State<SampleSyncfusionSlider> createState() => _SampleSyncfusionSliderState();
}

class _SampleSyncfusionSliderState extends State<SampleSyncfusionSlider> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ampleSyncfusionSlider ")),
      body: Center(
        child: SfSlider(
          min: 0.0,
          max: 100.0,
          value :_sliderValue,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 2,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
      )
    );
  }
}
