import 'package:dart_radio/models/station.dart';
import 'package:dart_radio/providers/player_provider.dart';
import 'package:dart_radio/providers/stations_provider.dart';
import 'package:dart_radio/widgets/mobile_footer.dart';
import 'package:dart_radio/widgets/station_list_item.dart';
import 'package:dart_radio/widgets/web_footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StationList extends StatefulWidget {
  @override
  _StationListState createState() => _StationListState();
}

class _StationListState extends State<StationList> {
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
    final player = Provider.of<PlayerProvider>(context);
    final stationsProvider = Provider.of<StationsProvider>(context);
    final List<Station> stations = stationsProvider.stations;
    final controller = ScrollController();

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
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
                  controller: controller,
                  itemCount: stations.length,
                  itemBuilder: (context, index) => StationListItem(
                    key: ValueKey(stations[index].name),
                    title: stations[index].displayName,
                    description: stations[index].description,
                    imageUrl: stations[index].image,
                    streamUrl: stations[index].streamUrl,
                    startPlaying: (String url) {
                      stationsProvider.setCurrentStation(stations[index]);
                      player.play(url);
                      if (!kIsWeb) {
                        Navigator.pushNamed(context, '/play');
                      }
                    },
                  ),
                ),
              )),
              if (!kIsWeb) MobileFooter(),
              if (kIsWeb) WebFooter(),
            ],
          );
  }
}
