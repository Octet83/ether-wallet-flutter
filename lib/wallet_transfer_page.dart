import 'package:ambwallet/components/wallet/transfer_form.dart';
import 'package:ambwallet/context/transfer/wallet_transfer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WalletTransferPage extends HookWidget {
  WalletTransferPage({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var transferStore = useWalletTransfer(context);
    var qrcodeAddress = useState();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: !transferStore.state.loading
                ? () {
                    Navigator.of(context).pushNamed(
                      "/qrcode_reader",
                      arguments: (scannedAddress) async {
                        qrcodeAddress.value = scannedAddress.toString();
                      },
                    );
                  }
                : null,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(79, 42, 152, 1), Color.fromRGBO(17, 35, 129, 1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: TransferForm(
                address: qrcodeAddress.value,
                onSubmit: (address, amount) async {
                  var success = transferStore.transfer(address, amount);
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
      ),
    );
  }
}
