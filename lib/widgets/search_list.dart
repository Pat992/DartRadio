import 'package:dart_radio/widgets/station_list.dart';
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget with PreferredSizeWidget {
  @override
  _SearchListState createState() => _SearchListState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class _SearchListState extends State<SearchList> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List stations = new List();  // TODO use pätricks list
  List filteredStations = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Dart Radio' );

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredStations = stations;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Dart Radio' );
        filteredStations = stations;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      actions: [ IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),],
    );
  }

}
