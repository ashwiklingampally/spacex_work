import 'package:graphql/client.dart';
import 'package:spacex_work/queries/getspacexlaunches.dart' as queries;
import 'models/launch.dart';

class GetLaunchRequestFailure implements Exception {}

class ApiClient {
  const ApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory ApiClient.create() {
    final httpLink = HttpLink('https://api.spacex.land/graphql/');
    final link = Link.from([httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<Launch>> getSpaceXLaunches() async {
    final result = await _graphQLClient.query(
      QueryOptions(document: gql(queries.getSpacexLaunchesquery)),
    );
    if (result.hasException) throw GetLaunchRequestFailure();
    final data = result.data?['launches'] as List;
    return data.map((e) => Launch.fromJson(e)).toList();
  }
}
