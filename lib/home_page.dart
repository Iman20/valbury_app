import 'package:flutter/material.dart';

import 'resource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Tab> tabsRs = [];
  final List<Tab> tabsKlinik = [];

  @override
  void initState() {
    super.initState();
    for (var element in dataRs) {
      tabsRs.add(_tabData(element.keys.first));
    }
    for (var element in dataKlinik) {
      tabsKlinik.add(_tabData(element.keys.first));
    }
  }

  Tab _tabData(value) => Tab(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.blueAccent, width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: Text(value),
          ),
        ),
      );

  Widget _header() => SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/hospital.png')),
                const SizedBox(width: 16,),
                Text('Valbury App',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.blue))
              ],
            ),
            const Icon(Icons.person_pin_circle_rounded,
                color: Colors.blue, size: 40),
          ],
        ),
      );

  Widget _section(title, subtitle) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      );

  Widget _sectionBanner() => SizedBox(
        height: 100,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.lightBlue[100]),
              child: Image.asset('assets/images/banner-1.png', fit: BoxFit.cover,),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.lightBlueAccent[100]),
                  child: Image.asset('assets/images/banner-2.png', fit: BoxFit.cover,),
            ),
          ],
        ),
      );

  Widget _sectionTab(list, tab) => DefaultTabController(
        length: list.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.blueAccent,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent),
              tabs: tab,
              labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            ),
            SizedBox(
              height: 350,
              child: TabBarView(
                  children: list.map<Widget>((value) {
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                        children: value.values.map<Widget>((value) {
                      return Column(
                        children: value.map<Widget>((value) {
                          return _cardData(value);
                        }).toList(),
                      );
                    }).toList()),
                  ),
                );
              }).toList()),
            ),
          ],
        ),
      );

  Widget _cardData(value) => Card(
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/hospital.png')),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value['name']!, style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12, fontWeight: FontWeight.bold),),
                    Flexible(child: Text(value['address']!, style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 10, fontWeight: FontWeight.normal),),)
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text('lihat detail', style: Theme.of(context).textTheme.caption)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _section('Rumah Sakit', 'Lihat Semua'),
                const SizedBox(height: 16),
                _sectionTab(dataRs, tabsRs),
                const SizedBox(height: 16,),
                _sectionBanner(),
                const SizedBox(height: 32,),
                _section('Klinik', 'Lihat Semua'),
                const SizedBox(height: 16,),
                _sectionTab(dataKlinik, tabsKlinik),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
