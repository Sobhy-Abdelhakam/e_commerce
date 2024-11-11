import 'package:flutter/material.dart';

class LoginScreenFooter extends StatelessWidget {
  const LoginScreenFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
            child: Divider(
          thickness: 0.5,
          indent: 40,
          endIndent: 10,
        )),
        Text(
          'Or Log in with',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Expanded(
            child: Divider(
          thickness: 0.5,
          indent: 10,
          endIndent: 40,
        )),
      ],
    );
  }
}
