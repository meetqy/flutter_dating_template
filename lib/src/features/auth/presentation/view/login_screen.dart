import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
            const SizedBox(
              height: 10,
            ),
            _password(),
            const SizedBox(
              height: 10,
            ),            
            _LoginButton(),
            const Spacer(
              flex: 2,
            ),
            _SigupRedirect()
          ],
        ),
      )),
    );
  }
}

class _SigupRedirect extends StatelessWidget {
  const _SigupRedirect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('signup');
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: 'アカウントを新規作成する'),
          TextSpan(
              text: 'サインアップ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Login',
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
