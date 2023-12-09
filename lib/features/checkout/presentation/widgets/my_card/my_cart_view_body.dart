import 'package:check_out_payment/core/widgets/custom_button.dart';
import 'package:check_out_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/my_card/card_info_item.dart';
import 'package:check_out_payment/features/checkout/presentation/total_price.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/my_card/payment_buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Expanded(
            child: Image.asset(
              "assets/images/basket_image.png",
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          const OrderInfoItem(
            title: "Order Subtotal",
            subTitle: '\$42.97',
          ),
          SizedBox(
            height: 3.h,
          ),
          const OrderInfoItem(
            title: "Discount",
            subTitle: '\$0',
          ),
          SizedBox(
            height: 3.h,
          ),
          const OrderInfoItem(
            title: "Shipping",
            subTitle: '\$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xFFC6C6C6),
          ),
          const TotalPrice(),
          SizedBox(
            height: 16.h,
          ),
          CustomButton(
            title: "Complete Payment",
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                context: context,
                builder: (context) {
                  return BlocProvider(
                      create: (context) => PaymentCubit(checkOutRepo),
                      child: const PaymentButtomSheet());
                },
              );
            },
          ),
          SizedBox(
            height: 12.h,
          )
        ],
      ),
    );
  }
}
