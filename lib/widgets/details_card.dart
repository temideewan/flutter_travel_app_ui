import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_travel_app/models/activity_model.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard(
      {super.key,
      required this.itemCount,
      required this.itemIndex,
      required this.activity});
  final int itemCount;
  final int itemIndex;
  final Activity activity;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  Text _buildRatingStars(int rating) {
    String stars = '';

    for (int i = 0; i < rating; i++) {
      stars += "⭐️ ";
    }

    stars.trim();

    return Text(stars);
  }

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..forward();
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _slideController,
                curve: Interval((widget.itemIndex / widget.itemCount),
                    min(((widget.itemIndex + 1) / widget.itemCount), 1),
                    curve: Curves.easeOutSine)));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _slideController,
        curve: Interval(widget.itemIndex / widget.itemCount, 1,
            curve: Curves.easeInOutBack)));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Stack(children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          child: Text(
                            widget.activity.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "\$${widget.activity.price}",
                              style: const TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            const Text("per pax",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Text(widget.activity.type,
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 5.0),
                    _buildRatingStars(widget.activity.rating),
                    const SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Container(
                          width: 70.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(widget.activity.startTimes[0])),
                      const SizedBox(width: 10.0),
                      Container(
                          width: 70.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(widget.activity.startTimes[1])),
                    ])
                  ]),
            ),
          ),
          Positioned(
            left: 20.0,
            bottom: 15.0,
            top: 15.0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                    width: 110.0,
                    image: AssetImage(widget.activity.imageUrl),
                    fit: BoxFit.cover)),
          )
        ]),
      ),
    );
  }
}
