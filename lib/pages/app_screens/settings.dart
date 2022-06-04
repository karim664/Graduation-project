import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup_demo/pages/signin/signup_screens/login_screen.dart';
import 'package:signup_demo/providers/theme_provider.dart';
import '../../providers/AppProvider_provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AppProvider>(context, listen: true);
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text('Theme', style: Theme.of(context).textTheme.bodyText2),
              const Spacer(
                flex: 3,
              ),
              ToggleButtons(
                fillColor: Colors.grey,
                borderColor: Theme.of(context).colorScheme.primary,
                borderWidth: 3,
                borderRadius: BorderRadius.circular(50),
                selectedBorderColor: Theme.of(context).colorScheme.primary,
                children: [
                  Icon(Icons.brightness_5,
                      color: Theme.of(context).colorScheme.primary),
                  Icon(
                    Icons.dark_mode,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
                isSelected: p.isSelected,
                onPressed: (index)async {
                  p.toggleChange(index);
                  if(index == 1)
                    {
                      theme.changeThemeMode();
                    }
                  else
                  {
                    theme.changeThemeMode();
                  }
                },
              ),
              const Spacer()
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                p.logOutChangeState();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen()));
              },
              child: Text(
                'LogOut',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary, fontSize: 20),
              ),
              color: Theme.of(context).colorScheme.primary,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
