import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_banking/screens/log_in_screen.dart';
import 'package:simple_banking/screens/sign_up_screen.dart';
import 'package:simple_banking/widgets/input_text_fied.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _url =
        'https://img.freepik.com/free-vector/vector-illustration-realistic-style-concept-mobile-payments-using-application-your-smartphone_1441-231.jpg?w=1380&t=st=1664492546~exp=1664493146~hmac=3d2918ddefe25b6c1b20a0ab6545b31437e4c3e39b87efb8e4f178f1b9447e88';
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              // color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Opacity(
                opacity: 0.8,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: _url,
                  errorWidget: (context, url, error) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
          Form(
            child: SingleChildScrollView(
              child: Column(
                children: [InputTextField(hintText: 'account number', onChanged: (e){}, icon: Icons.abc, userInputType: SignUpInput.password)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
