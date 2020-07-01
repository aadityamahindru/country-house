import 'package:countryhouse/Screens/CountryMap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(country["name"]),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: "Capital"),
              back: CountryDetailsCard(
                  title: country["capital"], color: Colors.amberAccent),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: "Population"),
              back: CountryDetailsCard(
                  title: country["population"].toString(),
                  color: Colors.lightGreenAccent),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: "Flag"),
              back: Card(
                color: Colors.pink[50],
                elevation: 10,
                child: Center(
                  child: SvgPicture.network(
                    country["flag"],
                    width: 200,
                  ),
                ),
              ),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: "Currency"),
              back: CountryDetailsCard(
                  title: country["currencies"][0]["name"],
                  color: Colors.cyanAccent[700]),
            ),
            FlipCard(
              direction: FlipDirection.VERTICAL,
              front: CountryCard(title: "Language"),
              back: CountryDetailsCard(
                  title: country["languages"][0]["name"], color: Colors.lime),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/country-map",arguments:{
                    "name":country["name"],
                  } );
                },
                child: CountryCard(title: "Show on Map")),
          ],
        ),
      ),
    );
  }
}

class CountryDetailsCard extends StatelessWidget {
  final String title;
  final Color color;
  CountryDetailsCard({this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  const CountryCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
