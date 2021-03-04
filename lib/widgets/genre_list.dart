import 'package:dart_radio/models/genre.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/genre_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenreList extends StatefulWidget {
  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stationsProvider = Provider.of<StationsProvider>(context);
    final List<Genre> genres = stationsProvider.genres;
    final controller = ScrollController();
    return Column(
      children: <Widget>[
        Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            showTrackOnHover: true,
            controller: controller,
            thickness: 10,
            hoverThickness: 10,
            child: ListView.builder(
              padding: EdgeInsets.only(right: 10),
              itemCount: genres.length,
              itemBuilder: (context, index) => GenreListItem(
                  key: ValueKey(genres[index].genre),
                  title: genres[index].genre),
            ),
          ),
        ),
      ],
    );
  }
}
