import 'package:flutter/material.dart';
import 'package:tentwentyassesment/common/widget/custom_chip.dart';
import 'package:tentwentyassesment/common/widget/primary_button.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/seat_booking/presentation/views/seat_booking_detail_view.dart';

import '../../../../core/app_utils.dart';
import '../../data/models/movie_time.dart';
import '../widgets/room_item.dart';

class SeatsBookingView extends StatefulWidget {
  final Movie movie;

  const SeatsBookingView({super.key, required this.movie});

  @override
  State<SeatsBookingView> createState() => _SeatsBookingView();
}

class _SeatsBookingView extends State<SeatsBookingView> {
  late MovieTime movieTime;

  @override
  void initState() {
    super.initState();
    movieTime = MovieTime.seed();
  }

  void _onSeatsSelectTap() {
    final room = movieTime.cinemaHallRooms[selectedRoomIndex];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SeatBookingDetailView(
                  movie: widget.movie,
                  room: room,
                )));
  }

  int selectedRoomIndex = 0;
  int selectedTimeIndex = 0;

  setRoomIndex(int index) {
    setState(() {
      selectedRoomIndex = index;
    });
  }

  setTimeIndex(int index) {
    setState(() {
      selectedTimeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateTimeString = dateFormatter(widget.movie.releaseDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        shape: Border(bottom: BorderSide(color: AppColors.greySemiLight, width: 1)),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
              )
            : null,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(widget.movie.title, style: textStyle16MediumBlack),
            SizedBox(height: 6),
            Text("In Theaters $dateTimeString", style: textStyle12MediumLightBlue),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date", style: textStyle16MediumBlack),
            SizedBox(height: 14),
            Wrap(
              spacing: 12,
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () => setTimeIndex(index),
                  child: CustomChipSecondary(
                      text: "${index + 1} Feb", backgroundColor: AppColors.blueLight, isActive: index == selectedTimeIndex),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: movieTime.cinemaHallRooms.length,
                itemBuilder: (context, index) {
                  final room = movieTime.cinemaHallRooms[index];
                  return GestureDetector(
                    onTap: () => setRoomIndex(index),
                    child: RoomItem(isActive: index == selectedRoomIndex, room: room),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(26),
        child: SafeArea(
          child: SolidButton.primary(
            onPressed: _onSeatsSelectTap,
            text: "Select Seats",
          ),
        ),
      ),
    );
  }
}
