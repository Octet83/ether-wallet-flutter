import 'package:ambwallet/components/copyButton/copy_button.dart';
import 'package:ambwallet/utils/eth_amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Balance extends StatelessWidget {
  Balance({this.address, this.ethBalance, this.tokenBalance});

  final String address;
  final BigInt ethBalance;
  final BigInt tokenBalance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(address ?? "", style:TextStyle(color: Colors.white)),
          CopyButton(
            
            text: const Text('Copy address'),
            value: address,
          ),
          QrImage(
            data: address ?? "",
            size: 150.0,
            foregroundColor: Colors.white,
          ),
          SizedBox(height:18),
          Text(
            "${EthAmountFormatter(ethBalance).format()} AMB",
            style: Theme.of(context).textTheme.body2.apply(fontSizeDelta: 6),
          )
        ],
      ),
    );
  }
}
