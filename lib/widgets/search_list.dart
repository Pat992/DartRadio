import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/station_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchList extends StatefulWidget with PreferredSizeWidget {
  @override
  _SearchListState createState() => _SearchListState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchListState extends State<SearchList> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List stations = new List();
  List filteredStations = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Dart Radio' );

  _SearchListState() {
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

  @override
  void initState() {
    callApi();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      actions: [
      new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),],
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredStations.length; i++) {
        if (filteredStations[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
          tempList.add(filteredStations[i]);
        }
      }
      filteredStations = tempList;
    }
    return ListView.builder(
      itemCount: stations == null ? 0 : filteredStations.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredStations[index]['name']),
          onTap: () => print(filteredStations[index]['name']),
        );
      },
    );
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

  // @override
  // Widget build(BuildContext context) {
  //   final stationsProvider = Provider.of<StationsProvider>(context);
  //   final List stations = stationsProvider.stations;  // use pätricks list
  //   return AppBar(
  //     centerTitle: true,
  //     title: _appBarTitle,
  //     actions: [ IconButton(
  //       icon: _searchIcon,
  //       onPressed: _searchPressed,
  //     ),],
  //   );
  // }

  Future<void> callApi() async {
    final response = await Provider.of<StationsProvider>(context, listen: false)
        .stations;
    List tempList = new List();
    for (int i = 0; i < response.length; i++) {
      tempList.add(response.data['name'][i]);
    }
    setState(() {
      stations = tempList;
      stations.shuffle();
      filteredStations = stations;
    });

  }

}