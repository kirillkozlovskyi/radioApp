import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AppLoadProgressbar extends StatefulWidget {
  const AppLoadProgressbar({Key? key}) : super(key: key);

  @override
  State<AppLoadProgressbar> createState() => _AppLoadProgressbarState();
}

class _AppLoadProgressbarState extends State<AppLoadProgressbar> {
  double progressValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/musicRecord.png'),
          scale: 2
        )
      ),
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 2500,
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 1,
            showLabels: false,
            showTicks: false,
            showFirstLabel: false,
            showAxisLine: false,
            startAngle: 270,
            endAngle: 270,
            pointers: <GaugePointer>[
              RangePointer(
                  value: progressValue,
                  width: 0.04,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.startCurve,
                  gradient: const SweepGradient(colors: <Color>[
                    Color(0xFF61449D),
                    Color(0xFFCB3DCE)
                  ], stops: <double>[
                    0.25,
                    0.75
                  ]
                )
              ),
              MarkerPointer(
                value: progressValue,
                markerType: MarkerType.circle,
                markerWidth: 14.0,
                markerHeight: 14.0,
                markerOffset: -2,
                color: const Color(0xFF9C40B8),
              )
            ],
          )
        ],
      ),
    );
  }
}
