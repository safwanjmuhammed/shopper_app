import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopper_app/src/common/molicule/app_success_dialog.dart';
import 'package:shopper_app/src/common/molicule/app_textfield.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import 'package:shopper_app/src/feature/home/data/source/remote_data_source/home_remote_data_source.dart';
import 'package:shopper_app/src/feature/home/presentation/provider/home_provider.dart';
import 'package:shopper_app/src/feature/home/presentation/provider/home_state.dart';
import 'package:shopper_app/src/feature/home/presentation/utils/home_constants.dart';
import 'package:shopper_app/src/feature/home/presentation/widgets/home/product_grid_widget.dart';

class ProductUpdateScreen extends ConsumerStatefulWidget {
  const ProductUpdateScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.productId,
  });

  final String name;
  final String description;
  final double price;
  final int productId;

  @override
  ConsumerState<ProductUpdateScreen> createState() =>
      _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends ConsumerState<ProductUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.name);
    _descriptionController = TextEditingController(text: widget.description);
    _priceController = TextEditingController(text: widget.price.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // TO:DO
  // call product update endpoint and pass needed [Product] data from state.
  // On success Update the state with the new product data , show success dailog and call context.pop();
  //
  void _handleUpdate() async {
    if (_formKey.currentState!.validate()) {
      try {
        final success =
            await ref.read(homeRemoteDataSourceProvider).updateProduct(Product(
                  id: widget.productId,
                  title: _nameController.text,
                  description: _descriptionController.text,
                  price: double.tryParse(_priceController.text),
                ));
        if (success) {
          ref.read(homeProvider.notifier).updateProduct(
              title: _nameController.text,
              description: _descriptionController.text,
              price: double.tryParse(_priceController.text));
          if (!mounted) return;

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AppSuccessDialog(
              title: 'Success!',
              message: 'Product updated successfully',
              onConfirm: () {
                context.pop();
                context.pop();
              },
            ),
          );
        }
      } finally {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: HomeColors.iconColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Edit Product',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: HomeColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: HomeColors.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Product Name Field
                        AppTextFiled(
                          controller: _nameController,
                          label: 'Product Name',
                          hint: 'Enter product name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter product name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Description Field
                        AppTextFiled(
                          controller: _descriptionController,
                          label: 'Description',
                          hint: 'Enter product description',
                          maxLines: 3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter product description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Price Field
                        AppTextFiled(
                          controller: _priceController,
                          label: 'Price',
                          hint: 'Enter price',
                          keyboardType: TextInputType.number,
                          prefixText: '\$ ',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter price';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Update Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _handleUpdate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HomeColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'UPDATE',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
