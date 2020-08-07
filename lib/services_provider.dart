import 'package:ambwallet/app_config.dart';
import 'package:ambwallet/service/address_service.dart';
import 'package:ambwallet/service/configuration_service.dart';
import 'package:ambwallet/service/contract_service.dart';
import 'package:ambwallet/utils/contract_parser.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class LoggingClient extends BaseClient {
  final Client _inner;

  LoggingClient(this._inner);

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (request is Request) {
      print('sending ${request.url} with ${request.body}');
    } else {
      print('sending ${request.url}');
    }

    final response = await _inner.send(request);
    final read = await Response.fromStream(response);

    print('response:\n${read.body}');

    return StreamedResponse(
        Stream.fromIterable([read.bodyBytes]), response.statusCode);
  }
}

Future<List<SingleChildCloneableWidget>> createProviders(
    AppConfigParams params) async {

  final client = Web3Client(params.web3HttpUrl, LoggingClient(Client()), socketConnector: () {
    return IOWebSocketChannel.connect(params.web3RdpUrl).cast<String>();
  });

  final sharedPrefs = await SharedPreferences.getInstance();

  final configurationService = ConfigurationService(sharedPrefs);
  final addressService = AddressService(configurationService);
  final contract = await ContractParser.fromAssets(
      'TargaryenCoin.json', params.contractAddress);

  final contractService = ContractService(client, contract);

  return [
    Provider.value(value: addressService),
    Provider.value(value: contractService),
    Provider.value(value: configurationService),
  ];
}
