import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_work/api/models/launch.dart';
import 'package:spacex_work/home/bloc/home_bloc.dart';
import 'package:spacex_work/home/widgets/launchitem.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(LaunchFetchStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SpaceX',
                  style: GoogleFonts.orbitron(
                    letterSpacing: 1.8,
                    color: Colors.black,
                    fontSize: 35,
                  )),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LaunchLoadDbSuccess || state is LaunchLoadFailure) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Check Internet"),
                ));
              }
              if (state is LaunchLoadDbSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("offline"),
                ));
              }
            },
            builder: (context, state) {
              if (state is LaunchLoadInProgress) {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              }
              if (state is LaunchLoadSuccess) {
                showConnectvityDialog(context);

                return ListView.builder(
                  itemCount: state.launches.length,
                  itemBuilder: (context, index) {
                    final launch = state.launches[index];
                    return LaunchItem(launch);
                  },
                );
              }
              if (state is LaunchLoadDbSuccess) {
                showConnectvityDialog(context);
                return ListView.builder(
                  itemCount: state.launches.length,
                  itemBuilder: (context, index) {
                    final launch = state.launches[index];
                    return LaunchItem(launch);
                  },
                );
              }
              return const Text('Oops something went wrong!');
            },
          ),
        ),
      ),
    );
  }

  showConnectvityDialog(BuildContext context) {
    AlertDialog(
      title: const Text('Connectivity issue'),
      content: const Text('Oops something went wrong!'),
      actions: <Widget>[
        TextButton(
          child: const Text('ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
