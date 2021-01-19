import 'package:flutter/material.dart';
import 'package:flutter_movie_app/email_subscription/view_model/subcription_view_model.dart';
import 'package:flutter_movie_app/utils.dart';

class EmailSubscriptionPage extends StatefulWidget {
  @override
  _EmailSubscriptionPageState createState() => _EmailSubscriptionPageState();
}

class _EmailSubscriptionPageState extends State<EmailSubscriptionPage> {
  TextEditingController _emailTxtController = TextEditingController();
  SubscriptionViewModel _viewModel = SubscriptionViewModelImpl();

  @override
  void initState() {
    _emailTxtController.addListener(
        () => _viewModel.inputMailText.add(_emailTxtController.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: buildDrawer(context),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: StreamBuilder<String>(
              stream: _viewModel.outputErrorText,
              builder: (context, snapshot) {
                return TextField(
                    controller: _emailTxtController,
                    decoration: InputDecoration(
                        hintText: "Email", errorText: snapshot.data));
              },
            )),
            StreamBuilder<bool>(
                stream: _viewModel.outputIsButtonEnabled,
                builder: (context, snapshot) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: FlatButton.icon(
                        onPressed: snapshot.data == true ? () {} : null,
                        color: Colors.lightBlueAccent,
                        disabledColor: Colors.grey,
                        icon: Icon(Icons.send_rounded),
                        label: Text('Subscribe')),
                  );
                })
          ],
        ),
      ),
    );
  }
}
