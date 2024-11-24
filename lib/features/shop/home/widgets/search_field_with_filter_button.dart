import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SearchFieldWithFilterButton extends StatelessWidget {
  const SearchFieldWithFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              hintText: TTexts.searchForClothes,
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.filter_alt_outlined,
          ),
        ),
      ],
    );
  }
}
