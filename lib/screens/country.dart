import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map country;
  const Country(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']['common']),
        backgroundColor: Colors.black,
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          FlipCard(
            front: const CountryCard("Capital"),
            back: CountryCard(country['capital'][0]),
          ),
          FlipCard(
            front: const CountryCard("Population"),
            back: CountryCard(country['population'].toString()),
          ),
          FlipCard(
            front: const CountryCard("Currency"),
            back: CountryCard(country['currencies'].toString()),
          ),
          FlipCard(
            front: const CountryCard("Flag"),
            back: CountryCard(country['flags']['png'].toString()),
          ),
          const FlipCard(
            front: CountryCard("Show on map"),
            back: CountryCard("Open map"),
          ),
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
