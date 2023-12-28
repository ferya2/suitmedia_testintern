import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_suitmedia/style/colors.dart';
import 'package:test_suitmedia/style/textstyle.dart';
import 'package:test_suitmedia/view/second_screen.dart';
import 'package:test_suitmedia/view/viewmodels/thirdscreen_viewmodels.dart';

class ThirdScreen extends StatefulWidget {
  final String name;

  const ThirdScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late ThirdScreenProvider provider;
  late String name;
  late String apiName;
  late GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  Future<void> _refreshData() async {
    await provider.getData();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ThirdScreenProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getData();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: TextStyleApp.appbarTextStyle,
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/Arrow-Left2.png'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(
                  name: name,
                  apiName: '',
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.white,
        elevation: 0.5,
      ),
      body: RefreshIndicator(
        color: ColorsApp.black,
        key: refreshKey,
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Consumer<ThirdScreenProvider>(
                  builder: (context, provider, child) {
                    if (provider.personModel == null) {
                      // Data belum dimuat
                      return Center(
                          child: CircularProgressIndicator(
                              color: ColorsApp.black));
                    } else if (provider.personModel!.data.isEmpty) {
                      // Data kosong
                      return const Text('No data available');
                    } else {
                      return Column(
                        children: ListTile.divideTiles(
                          context: context,
                          tiles: provider.personModel!.data.map((person) {
                            return ListTile(
                              title: Text(
                                '${person.firstName} ${person.lastName}',
                                style: TextStyleApp.namaTextStyle,
                              ),
                              subtitle: Text(
                                person.email.toUpperCase(),
                                style: TextStyleApp.subTextStyle,
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(person.avatar),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondScreen(
                                      apiName:
                                          '${person.firstName} ${person.lastName}',
                                      name: name,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                        ).toList(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 62),
            ],
          ),
        ),
      ),
    );
  }
}
