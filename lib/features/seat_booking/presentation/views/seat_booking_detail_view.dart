import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tentwentyassesment/common/widget/app_svg.dart';
import 'package:tentwentyassesment/common/widget/primary_button.dart';

import '../../../../core/app_style.dart';
import '../../../../core/app_utils.dart';
import '../../../movies/data/models/movie.dart';
import '../../data/models/movie_time.dart';
import '../../data/models/seat_layout_state.dart';
import '../../data/models/seat_number.dart';
import '../../data/models/seat_state.dart';
import '../widgets/seat_layout_widget.dart';

class SeatBookingDetailView extends StatefulWidget {
  final Movie movie;
  final CinemaHallRoom room;

  const SeatBookingDetailView({super.key, required this.movie, required this.room});

  @override
  State<SeatBookingDetailView> createState() => _SeatBookingDetailView();
}

class _SeatBookingDetailView extends State<SeatBookingDetailView> {
  Set<SeatNumber> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    final dateTimeString = dateFormatter(widget.movie.releaseDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        shape: Border(bottom: BorderSide(color: AppColors.greySemiLight, width: 1)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(widget.movie.title, style: textStyle16MediumBlack),
            SizedBox(height: 6),
            Text("Feb 2, 2025 | ${widget.room.roomName}", style: textStyle12MediumLightBlue),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                AppSvgAsset("assets/ic/ic_cinema_shape.svg", height: 113, width: 144),
                Text("SCREEN", style: textStyle8MediumGreySemiMoreLight,),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: SizedBox(
                width: double.maxFinite,
                height: 600,
                child: SeatLayoutWidget(
                   onSeatStateChanged: (rowI, colI, seatState) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: seatState == SeatState.selected
                            ? Text("Selected Seat[$rowI][$colI]")
                            : Text(
                                "De-selected Seat[$rowI][$colI]",
                              ),
                      ),
                    );
                    if (seatState == SeatState.selected) {
                      selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                    } else {
                      selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                    }
                  },
                  stateModel: const SeatLayoutStateModel(
                      pathDisabledSeat: 'assets/ic/ic_seat_disabled.svg',
                      pathSelectedSeat: 'assets/ic/ic_seat_select.svg',
                      pathSoldSeat: 'assets/ic/ic_seat_booked.svg',
                      pathUnSelectedSeat: 'assets/ic/ic_seat_unselected.svg',
                      rows: 10,
                      cols: 23,
                      seatSvgSize: 15,
                      currentSeatsState: [
                        [
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.disabled,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.disabled,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.empty,
                          SeatState.empty,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                      ]),
                ),
              ),
            ),
            Container(
              height: 240,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/ic/ic_seat_disabled.svg', width: 15, height: 15),
                          SizedBox(width: 1.84),
                          const Text('VIP (150\$)', style: textStyle12MediumGreySemiMoreLight)
                        ],
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/ic/ic_seat_booked.svg', width: 15, height: 15),
                          SizedBox(width: 1.84),
                          const Text('Not Available', style: textStyle12MediumGreySemiMoreLight)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/ic/ic_seat_unselected.svg', width: 15, height: 15),
                          SizedBox(width: 1.84),
                          const Text('Available', style: textStyle12MediumGreySemiMoreLight)
                        ],
                      ),
                      SizedBox(
                        width: 55,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/ic/ic_seat_select.svg', width: 15, height: 15),
                          SizedBox(width: 1.84),
                          const Text('Selected', style: textStyle12MediumGreySemiMoreLight)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.greySemiLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: '4 /', style: textStyle14MediumBlack),
                      TextSpan(text: '\$300    ', style: textStyle10RegularBlack),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.close_rounded, size: 14, color: AppColors.black),
                      ),
                    ])),
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.greySemiLight,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: textStyle10RegularBlack,
                                  ),
                                  Text(
                                    "\$50",
                                    style: textStyle16SemiBoldBlack,
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(flex: 2, child: SolidButton.primary(onPressed: () {}, text: "Proceed To Pay"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
