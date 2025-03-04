import 'package:flutter/material.dart';
import 'package:tentwentyassesment/features/seat_booking/data/models/seat_layout_state.dart';

import '../../data/models/seat.dart';
import '../../data/models/seat_state.dart';
import 'seat_widget.dart';

class SeatLayoutWidget extends StatelessWidget {
  final SeatLayoutStateModel stateModel;
   final void Function(int rowI, int colI, SeatState currentState) onSeatStateChanged;


  const SeatLayoutWidget({
    super.key,
    required this.stateModel,
    required this.onSeatStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
       maxScale: 5,
      minScale: 0.8,
      boundaryMargin: const EdgeInsets.all(8),
      constrained: true,
      child: Column(
        children: [
          ...List<int>.generate(stateModel.rows, (rowI) => rowI).map<Row>(
                (rowI) => Row(
              children: [
                ...List<int>.generate(stateModel.cols, (colI) => colI).map<SeatWidget>((colI) => SeatWidget(
                  model: SeatModel(
                    seatState: stateModel.currentSeatsState[rowI][colI],
                    rowI: rowI,
                    colI: colI,
                    seatSvgSize: stateModel.seatSvgSize,
                    pathSelectedSeat: stateModel.pathSelectedSeat,
                    pathDisabledSeat: stateModel.pathDisabledSeat,
                    pathSoldSeat: stateModel.pathSoldSeat,
                    pathUnSelectedSeat: stateModel.pathUnSelectedSeat,
                  ),
                  onSeatStateChanged: onSeatStateChanged,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

