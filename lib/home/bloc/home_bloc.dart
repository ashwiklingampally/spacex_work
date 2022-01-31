import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:spacex_work/api/apiclient.dart';
import 'package:spacex_work/api/models/launch.dart';

part 'home_event.dart';
part 'home_state.dart';

const String boxName = "launches";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LaunchLoadInProgress()) {
    on<LaunchFetchStarted>(_onLaunchFetchStarted);
  }

  void _onLaunchFetchStarted(
    LaunchFetchStarted event,
    Emitter<HomeState> emit,
  ) async {
    final ApiClient _apiClient = ApiClient.create();
    emit(LaunchLoadInProgress());
    var box = await Hive.openBox<Launch>(boxName);

    try {
      final launches = await _apiClient.getSpaceXLaunches();

      if (box.isEmpty) storeDataInDB(launches);

      emit(LaunchLoadSuccess(launches));
    } catch (_) {
      if (box.isNotEmpty) {
        emit(LaunchLoadDbSuccess(box.values.toList()));
      } else {
        emit(LaunchLoadFailure());
      }
    }
  }
}

storeDataInDB(List<Launch> launches) async {
  var box = await Hive.openBox<Launch>(boxName);
  for (var element in launches) {
    await box.add(element);
  }
}
