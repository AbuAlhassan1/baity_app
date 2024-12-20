import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CurrentLocationBar extends StatefulWidget {
  const CurrentLocationBar({super.key});

  @override
  State<CurrentLocationBar> createState() => _CurrentLocationBarState();
}

class _CurrentLocationBarState extends State<CurrentLocationBar> {

  // Position? position;

  // Future<void> _getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return;
  //   }

  //   // Request location permission
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return;
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return;
  //   }

  //   // Get the current location
  //   position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  //   setState(() {});

  // }

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize(20)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Location", style: TextStyle(fontSize: getSize(14), color: Colors.grey)),
                    Text("Jl. Raya Bogor, Jakarta", style: TextStyle(fontSize: getSize(16), fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              // if (position != null) Text("Lat: ${position!.latitude}, Long: ${position!.longitude}"),
              // if (position == null) Text("Lat: - , Long: -"),
              IconButton(
                onPressed: (){},
                icon: const Icon(TablerIcons.bell_filled, color: Colors.black),
              )
            ],
          ),
        ),
      )
    );
  }
}