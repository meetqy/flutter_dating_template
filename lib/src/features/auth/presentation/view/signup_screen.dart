import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/presentation/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            _username(),
            const SizedBox(
              height: 10,
            ),
            _Email(),
            const SizedBox(
              height: 10,
            ),
            _password(),
            const SizedBox(
              height: 10,
            ),
            _SignupButton(),
            const Spacer(
              flex: 2,
            ),
            _LoginRedirect()
          ],
        ),
      )),
    );
  }
}

class _LoginRedirect extends StatelessWidget {
  const _LoginRedirect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('login');
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'ログイン画面に戻る'),
          TextSpan(
              text: 'Login',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Signup',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              )),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: Size(100, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

class _username extends StatelessWidget {
  const _username({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFields(
        labeltext: 'username', textInputType: TextInputType.name);
  }
}

class _Email extends StatelessWidget {
  const _Email({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFields(
        labeltext: 'username', textInputType: TextInputType.name);
  }
}

class _password extends StatelessWidget {
  const _password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFields(
      labeltext: 'Password',
      textInputType: TextInputType.name,
      obscureText: true,
    );
  }
}
