import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopper_app/src/common/molicule/app_success_dialog.dart';
import 'package:shopper_app/src/common/molicule/app_textfield.dart';
import 'package:shopper_app/src/feature/home/data/model/product_model.dart';
import 'package:shopper_app/src/feature/home/presentation/provider/home_provider.dart';
import 'package:shopper_app/src/feature/home/presentation/provider/home_state.dart';
import 'package:shopper_app/src/feature/home/presentation/utils/home_constants.dart';

class ProductUpdateScreen extends ConsumerStatefulWidget {
  const ProductUpdateScreen({
    super.key,
  });

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

    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();

    ref.listenManual<AsyncValue<HomeState>>(
      homeProvider,
      (previous, next) {
        print('${next.value}bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
        final product = next.value?.product;
        if (product == null) return;

        if (_nameController.text.isEmpty) {
          _nameController.text = product.title ?? '';
        }
        if (_descriptionController.text.isEmpty) {
          _descriptionController.text = product.description ?? '';
        }
        if (_priceController.text.isEmpty) {
          _priceController.text = product.price?.toString() ?? '';
        }
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _handleUpdate() {
    if (_formKey.currentState!.validate()) {
      // TO:DO
      // call product update endpoint and pass needed [Product] data from state.
      // On success Update the state with the new product data , show success dailog and call context.pop();
      //

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AppSuccessDialog(
          title: 'Success!',
          message: 'Product updated successfully',
          onConfirm: () {
            Navigator.of(context).pop();
          },
        ),
      );
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
