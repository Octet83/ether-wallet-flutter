import 'package:ambwallet/components/wallet/import_wallet_form.dart';
import 'package:ambwallet/context/setup/wallet_setup_provider.dart';
import 'package:ambwallet/model/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WalletImportPage extends HookWidget {
  WalletImportPage(this.title);

  final String title;

  Widget build(BuildContext context) {
    var store = useWalletSetup(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey.shade700, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(title, style:TextStyle(color: Colors.grey.shade700, fontSize: 18)),
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
        child: ImportWalletForm(
          errors: store.state.errors.toList(),
          onImport: !store.state.loading
              ? (type, value) async {
                  switch (type) {
                    case WalletImportType.mnemonic:
                      if (!await store.importFromMnemonic(value)) return;
                      break;
                    case WalletImportType.privateKey:
                      if (!await store.importFromPrivateKey(value)) return;
                      break;
                    default:
                      break;
                  }

                  Navigator.of(context).popAndPushNamed("/");
                }
              : null,
        ),
      ),
    );
  }
}
