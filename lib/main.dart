import 'package:flutter/material.dart';
import 'package:product_modal/screens/product_detail_modal.dart';
import 'package:product_modal/utils/orientation_util.dart';
import 'package:product_modal/utils/providers.dart';
import 'package:product_modal/utils/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductInfoLoadNotifier(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: setVerticalOrientations(),
          builder: (context, snapshot) {
            SizeConfig().init(context);
            return Scaffold(
              appBar: AppBar(title: Text('Product Detail Modal Test')),
              body: Center(child: Consumer<ProductInfoLoadNotifier>(
                builder: (context, provider, _) {
                  if (provider.isProductLoaded != true) {
                    provider.loadData(context: context);
                    return SizedBox.shrink();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      showDialog(
                          useSafeArea: true,
                          context: context,
                          barrierColor: Colors.white,
                          builder: (context) {
                            return Scaffold(
                                resizeToAvoidBottomInset: false,
                                backgroundColor: Colors.transparent,
                                body: ProductDetailModal(
                                  productInfo: provider.productInfo,
                                ));
                          });
                    },
                    child: Text('Show Modal'),
                  );
                },
              )),
            );
          },
        ),
      ),
    );
  }
}
