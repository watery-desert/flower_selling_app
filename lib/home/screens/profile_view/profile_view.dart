import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../../widgets/filled_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/theme.dart';
import '../../../authentication/authentication_bloc/authentication_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().state.user;
    final themeCubit = context.read<ThemeCubit>();
    final bool isLight = context.watch<ThemeCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 260,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(
            'https://images.unsplash.com/photo-1636846013029-8723f6c4fab6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
          child: Text(
            "Developer Ahmed",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          title: Text("${user.email}"),
        ),
        const ListTile(
          title: Text('Address'),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        const ListTile(
          title: Text('Track Order'),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        const ListTile(
          title: Text('Purchase history'),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTile(
           
          onTap: () {
            isLight ? themeCubit.changeToDark() : themeCubit.changeToLight();
          },
          title: Text(isLight ? 'Dark Theme' : 'Light Theme'),
          trailing: Icon(isLight ? FeatherIcons.moon : FeatherIcons.sun),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FilledButton(
              title: "Sign Out",
              onTap: () {
                context.read<AuthenticationBloc>().add(
                      AuthenticationSignOutRequested(),
                    );
              }),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
