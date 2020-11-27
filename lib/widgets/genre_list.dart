import 'package:dart_radio/models/genre.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/genre_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenreList extends StatefulWidget {
  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList>{
  bool _isLoading = false;

  @override
  void initState() {
    callApi();
    super.initState();
  }

  Future<void> callApi() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<StationsProvider>(context, listen: false)
        .getApiInformation();

    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    final List<Genre> genres = stationsProvider.genres;

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: genres.length,
            itemBuilder: (context, index) => GenreListItem(
              key: ValueKey(genres[index].genre),
              title: genres[index].genre
            ),
          ),
        ),
      ],
    );
  }


}

