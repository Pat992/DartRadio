import 'package:dart_radio/providers/stations_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget with PreferredSizeWidget {
  final bool searchStations;

  const SearchList({Key key, this.searchStations = true}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchListState extends State<SearchList> {
  final TextEditingController _filter = new TextEditingController();

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Dart Radio' );

  updateList(_searchText) {
    Provider.of<StationsProvider>(context, listen: false).getStations(searchText: _filter.text);
  }

  updateGenres(_searchText) {
    Provider.of<StationsProvider>(context, listen: false).getGenres(searchText: _filter.text);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      actions: [
      new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),],
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          controller: _filter,
          onChanged:widget.searchStations ? updateList : updateGenres,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Theme.of(context).accentColor),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Dart Radio' );
        Provider.of<StationsProvider>(context, listen: false).getStations();
        _filter.clear();
      }
    });
  }
}