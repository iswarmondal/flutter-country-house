import 'package:flutter/material.dart';
import 'package:flutter_country_house/screens/country.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({super.key});

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  late Future<List> countries;
  Future<List> getCountries() async {
    final dio = Dio();
    final response = await dio.get('https://restcountries.com/v3.1/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All countries"),
        shadowColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List>(
        future: countries,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return ListView.builder(itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Country(snapshot.data![index] as Map),
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Text(
                      snapshot.data![index]['name']['common'] as String,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            });
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        },
      ),
      // body: ListView(
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(builder: (context) => const Country("India")),
      //         );
      //       },
      //       child: const Card(
      //         elevation: 10,
      //         child: Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //           child: Text("India"),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //               builder: (context) => const Country("Canada")),
      //         );
      //       },
      //       child: const Card(
      //         elevation: 10,
      //         child: Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //           child: Text("Canada"),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
