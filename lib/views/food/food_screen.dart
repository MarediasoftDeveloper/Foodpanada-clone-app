import 'package:flutter/material.dart';
import 'package:foodpanda_clone/config/app_colors.dart';
import 'package:foodpanda_clone/core/widgets/custom_text_widget.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !_isCollapsed) {
        setState(() => _isCollapsed = true);
      } else if (_scrollController.offset <= 200 && _isCollapsed) {
        setState(() => _isCollapsed = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Custom App Bar
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 320,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(background: const TopSection()),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(12),
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: FoodScreenSearchBar(),
              ),
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const CategoryIcons(),
                const SizedBox(height: 20),
                const FoodCategories(),
                const SizedBox(height: 20),
                const BankCodesPromo(),
                const SizedBox(height: 24),
                const FilterButtons(),
                const SizedBox(height: 20),
                const ResturationSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD91C5C),
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextWidget(
                    text: 'BHU Baqar Nizamani',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  CustomTextWidget(
                    text: 'Baqar Nizamani',
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE5267A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Here's 50% off & free\ndelivery on your first\norder!",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          CustomTextWidget(
                          text:   'Start ordering',
                              color: Colors.white.withOpacity(0.95),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  'assets/pizza.png',
                  width: 110,
                  height: 110,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FilterButtonWidget(icon: Icons.tune, label: '', isIcon: true),
            const SizedBox(width: 8),
            FilterButtonWidget(icon: null, label: 'Sort'),
            const SizedBox(width: 8),
            FilterButtonWidget(icon: null, label: 'Offers'),
            const SizedBox(width: 8),
            FilterButtonWidget(
              icon: Icons.star,
              label: 'Ratings 4.0+',
              isIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}

class BankCodesPromo extends StatelessWidget {
  const BankCodesPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD4E5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextWidget(
               text:    'Save more\nwith bank\ncodes',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF1C68), Color(0xFFFF5A8F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.discount, color: Colors.white, size: 24),
                ),
                Center(
                  child: Image.asset(
                    'assets/burger.jpg',
                    width: 80,
                    height: 80,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 40,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCategories extends StatelessWidget {
  const FoodCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FoodCategoryWidget(
            imagePath: 'assets/burger.jpg',
            label: 'Fast Food',
          ),
          FoodCategoryWidget(
            imagePath: 'assets/chicken.jpg',
            label: 'American',
          ),
          FoodCategoryWidget(imagePath: 'assets/pizza.jpg', label: 'Western'),
        ],
      ),
    );
  }
}

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CategoryIconWidget(
            icon: Icons.local_offer,
            label: 'Offers',
            color: const Color(0xFFFF5A8F),
          ),
          CategoryIconWidget(
            icon: Icons.shopping_bag,
            label: 'Pick-up',
            color: const Color(0xFFFF5A8F),
          ),
          CategoryIconWidget(
            icon: Icons.restaurant,
            label: 'Homechefs',
            color: const Color(0xFFFF5A8F),
          ),
        ],
      ),
    );
  }
}

class FoodScreenSearchBar extends StatelessWidget {
  const FoodScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for restaurants and groceries',
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
          prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 24),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}

class ResturationSection extends StatelessWidget {
  const ResturationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'Explore restaurants',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          const SizedBox(height: 16),
          RestaurantCardWidget(),
          const SizedBox(height: 16),
          RestaurantCardWidget(),
        ],
      ),
    );
  }
}

// ============= Reusable Widgets =============

class CategoryIconWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CategoryIconWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        CustomTextWidget(
          text: label,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ],
    );
  }
}

class FoodCategoryWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const FoodCategoryWidget({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.fastfood, size: 40, color: Colors.grey);
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        CustomTextWidget(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ],
    );
  }
}

class FilterButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool isIcon;

  const FilterButtonWidget({
    Key? key,
    this.icon,
    required this.label,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          if (isIcon && icon != null) ...[
            Icon(icon, size: 18, color: Colors.black87),
            if (label.isNotEmpty) const SizedBox(width: 6),
          ],
          if (label.isNotEmpty)
            CustomTextWidget(
              text: label,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          if (!isIcon) ...[
            const SizedBox(width: 6),
            Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey[700]),
          ],
        ],
      ),
    );
  }
}

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF1C68), Color(0xFF4A90E2)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: 'Donate to',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomTextWidget(
                    text: 'Gaza!',
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextWidget(
                    text:   'Support for Gaza - WFP',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                         CustomTextWidget(
                          text: '5.0',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                     text:     ' (1000+)',
                            fontSize: 13,
                            color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                CustomTextWidget(
                  text: '5-20 min · \$\$\$ · American',
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
