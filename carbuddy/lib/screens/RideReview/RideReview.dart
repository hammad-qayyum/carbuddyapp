import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carbuddy/screens/Home/Home.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 

class RideReview extends StatefulWidget {
  const RideReview({ Key? key }) : super(key: key);

  @override
  _RideReviewState createState() => _RideReviewState();
}

class _RideReviewState extends State<RideReview> {
  double _review_rating = 3.0;
  String _comment= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Vehicle Registration"), )),    
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'How was your ride?',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 10),
                    // SmoothStarRating(
                    //   rating: _review_rating,
                    //   isReadOnly: false,
                    //   size: 40,
                    //   filledIconData: Icons.star,
                    //   halfFilledIconData: Icons.star_half,
                    //   defaultIconData: Icons.star_border,
                    //   starCount: 5,
                    //   allowHalfRating: true,
                    //   spacing: 2.0,
                    //   onRated: (value) {
                    //     print("rating value -> $value");
                    //     // print("rating value dd -> ${value.truncate()}");
                    //   },
                    // ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        _review_rating=rating;
                        print(_review_rating);
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Comments'),
                      keyboardType: TextInputType.text,
                      onSaved: (var value) {
                        _comment = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff14279B),
                              Color(0xff14279B),
                            ],
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
        ),
      ),  
    );
  }
}