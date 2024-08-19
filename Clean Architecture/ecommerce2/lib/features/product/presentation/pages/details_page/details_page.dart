import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'size.dart';
// import 'update_page.dart';
// import 'product.dart';
// import 'product_provider.dart';
// import 'animation.dart';

import '../../../../../service_locator.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecase/delete.dart';
import '../../../domain/usecase/get_all_products.dart';
import '../../../domain/usecase/get_product.dart';
import '../../../domain/usecase/update.dart';
import '../../toos_for_pages/navigation_animation.dart';
import '../../bloc/details_page_bloc/details_page_bloc.dart';
import '../home_page/home_page.dart';
import '../update_page/update_page.dart';
import 'size.dart';

class DetailsPage extends StatefulWidget {
  final ProductEntity product;

  DetailsPage({required this.product, Key? key}) : super(key: key);

  final delete_product_usecase = getIt<DeleteProductUseCase>();
  final update_product_usecase = getIt<UpdateProductUseCase>();

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final shoeCount = 6;
  final List<int> shoeSizes = [38, 39, 40, 41, 42, 43, 44];
  int? selectedSize = 38;

  void selectSize(int size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return  Scaffold(
          backgroundColor: Colors.white,
          body: //BlocProvider(
            //create: (context) => DetailsPageBloc(deleteProductUseCase: widget.delete_product_usecase),
            //child:
             Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 280,
                      width: 380,
                      child: Image(image: NetworkImage(product.imageUrl), fit: BoxFit.fill),
                    ),
                    // Image.asset(product.imagePath),

                    Padding(
                      padding:
                          EdgeInsets.only(top: 21.0, left: 24.0, right: 24.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'product',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFeatures: [FontFeature.enable('palt')],
                                    fontSize: 10,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Color.fromRGBO(255, 215, 0, 1),
                                        size: 19),
                                    Text('(${4.5})',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(62, 62, 62, 1),
                                      fontWeight: FontWeight.w600,
                                      fontFeatures: [
                                        FontFeature.enable('palt')
                                      ],
                                      fontSize: 24,
                                    )),
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  'Size',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                              color: Colors.white,
                              child: SizedBox(
                                  width: 366,
                                  height: 70,
                                  child: ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int idx) {
                                      int size = shoeSizes[idx];
                                      return ShoeSize(
                                          shoeSize: size,
                                          isSelected: selectedSize == size,
                                          onTap: () {
                                            selectSize(size);
                                          });
                                    },
                                    itemCount: shoeCount,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  )),
                            ),
                            SizedBox(height: 12),
                            SingleChildScrollView(
                              child: Container(
                                width: 366,
                                height: 260,
                                child: Text(
                                  product.description,
                                  style: TextStyle(
                                    color: Color.fromRGBO(102, 102, 102, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 152,
                                  height: 50,
                                  child: BlocListener<DetailsPageBloc,
                                      DetailsPageState>(
                                    listener: (context, state) {
                                      if (state is LoadingState) {
                                        Text('Loading...');
                                      } else if (state is DeleteSuccessState) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Product Deleted Successfully.")));
                                          // Navigator.of(context).push(createFadeRoute(HomePage()));
                                          Navigator.of(context).pop(true);
                                      } else if (state is FailureState) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(state.message)));
                                      }
                                    },
                                    child: ElevatedButton(
                                      onPressed: () { 
                                        context.read<DetailsPageBloc>().add(DetailsPageEvent(id: widget.product.id));
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          Colors.white,
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: Colors.red)),
                                        ),
                                      ),
                                      child: Text('DELETE',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 152,
                                  height: 50,
                                  child: ElevatedButton(
                                        onPressed: () {
                                        Navigator.push(
                                         context,
                                         createFadeRoute(
                                           UpdateProduct(product: product)),
                                        );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                            Color.fromRGBO(63, 81, 243, 1),
                                          ),
                                          shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: Text('UPDATE',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)),
                                      )
                                
                                    
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  width: 40,
                  height: 40,
                  top: 35,
                  left: 16,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: CircleBorder(),
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromRGBO(63, 81, 243, 1),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //)
          );

    // routes: {
    //   "/updatepage" : (context) => UpdateProduct(),
    // }
  }
}
