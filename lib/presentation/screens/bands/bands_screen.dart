import 'package:flu_avm/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BandsScreen extends StatelessWidget {
  const BandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) {
          return _bandTile(bands[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () => addereNovmBan(context),
        child: Icon(Icons.add),
      ),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(band.nomen.substring(0, 2).toUpperCase()),
      ),
      title: Text(band.nomen),
      trailing: Text('${ band.numerusVotum }', style: TextStyle(fontSize: 20),),
    );
  }
}

addereNovmBan(BuildContext context) {
  final TextEditingController textumController = TextEditingController();

  showCupertinoDialog(
    context: context, 
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('New band name'),
      content: CupertinoTextField(
        controller: textumController,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark 
            ? Colors.white 
            : Colors.black
        )
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Add'),
          onPressed: () {
            addereBandACollectione(context, textumController.text);
          }
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Close'),
          onPressed: () => context.pop()
        ),
      ],
    )
  );
}

addereBandACollectione(BuildContext context, String nomen) {
  print(nomen);
  context.pop();
  bands.add(Band(id: DateTime.now().toString(), nomen: nomen, numerusVotum: 0));
}