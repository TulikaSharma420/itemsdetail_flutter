import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'Screens/HomeScreen/homeScreen.dart';

const productsGrapghql="""
query {
  launchesPast(limit: 10) {
    mission_name
    launch_date_local
    launch_site {
      site_name
    }
    links {
      mission_patch_small
      flickr_images
    }
    rocket {
      rocket_name
    }
    launch_success
    details
  }
}

""";




void main() {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

ValueNotifier<GraphQLClient> client = ValueNotifier(
GraphQLClient(link: HttpLink('https://api.spacex.land/graphql'), cache: GraphQLCache(store: InMemoryStore()),)
);

var app =GraphQLProvider(client: client,child: MyApp(),);

  runApp(app);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

