import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/homepage_cubit.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error!'),
      ),
      body: Center(
        child: SizedBox(
          child: Image.asset('assets/images/error_page_image.png'),
        ),
      ),
    );
  }
}
