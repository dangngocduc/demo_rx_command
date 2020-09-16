# Demo Rx_command Flutter

A new Flutter application demo using rx_command.

# Library
*get_it*: Inject Bloc to widget.

*rx_command*: State Management.

# Check state screen by authorize
```
   StreamBuilder<bool>(
        builder: (context, snap) {
          if (snap.data == null) return SplashPage();
          if (snap.data) {
            return MainPage();
          } else {
            return  AuthNavigation();
          }
        },
      stream: locator.get<AuthBloc>().isAuthorized.asBroadcastStream(),
    )
```

# SingIn logic
Create SignIn command
```
      @override
      void initState() {
        super.initState();
        signInCommand = RxCommand.createAsyncNoParam(() => locator.get<AuthBloc>().signIn(userName, password));
      }

```
Execute when user SingIn
```
    signInCommand.call();
```
Check Command is executing to show loading in SignIn
```
    StreamBuilder<bool>(
        builder: (context, snap) {
          ...
        },
        stream: signInCommand.isExecuting,
    )
```


