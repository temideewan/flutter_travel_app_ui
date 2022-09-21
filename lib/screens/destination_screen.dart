import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_travel_app/models/activity_model.dart';
import 'package:my_travel_app/models/destination_model.dart';
import 'package:my_travel_app/widgets/details_card.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key, required this.destination});

  final Destination destination;

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen>
    with SingleTickerProviderStateMixin {
  BorderRadius topImageRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: topImageRadius,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0),
                ],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: topImageRadius,
                  child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.arrowDownShortWide),
                        iconSize: 25.0,
                        color: Colors.black,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2)),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.locationArrow,
                            size: 15.0, color: Colors.white70),
                        const SizedBox(width: 5.0),
                        Text(widget.destination.country,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 20.0)),
                      ],
                    ),
                  ]),
            ),
            const Positioned(
                right: 20.0,
                bottom: 20.0,
                child:
                    Icon(Icons.location_on, color: Colors.white70, size: 25.0))
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.destination.activities.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return DetailsCard(
                    itemCount: widget.destination.activities.length,
                    itemIndex: index,
                    activity: activity);
              }),
        ),
      ],
    ));
  }
}
