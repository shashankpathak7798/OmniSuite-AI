import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/modules/landing/presentation/widgets/feature_card_widget.dart';
import 'package:omnisuite_front_end/modules/landing/presentation/widgets/header_widget.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';


class LandingDesktopView extends StatelessWidget {
  const LandingDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      body: Column(
        children: [
          UIHelpers.verticalSpaceLarge,
          const HeaderWidget(),
          UIHelpers.verticalSpaceSmall,
          Divider(
            color: OmniSuiteColors.primary.shade1,
            thickness: 1.5,
          ),
          UIHelpers.verticalSpaceTiny,
          Text('Our Features', style: OmniSuiteTextStyle.normal.copyWith(fontStyle: FontStyle.italic,),),
          UIHelpers.verticalSpaceTiny,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeatureCardWidget(
                 backgroundGif: 'assets/gifs/text_model_background.gif',
                 title: 'Text Generation AI',
                 description: "Harness the power of cutting-edge artificial intelligence to effortlessly generate high-quality text content for a wide range of purposes. Whether you need creative storytelling, informative articles, engaging social media posts, or personalized messages, our text generation AI model delivers natural and coherent text tailored to your needs. With advanced natural language processing capabilities, it adapts to your writing style, context, and preferences, ensuring seamless integration into your projects. Say goodbye to writer's block and tedious content creation tasks – unleash the potential of AI-driven text generation to fuel your creativity and productivity like never before.",
              ),
              FeatureCardWidget(
                backgroundGif: 'assets/gifs/text_model_background.gif',
                 title: 'Image Generation AI',
                 description: "Unlock the power of artificial intelligence to produce stunning, high-quality images tailored to your specifications. Our image generation AI utilizes cutting-edge deep learning techniques to generate visually appealing graphics, illustrations, and photos with remarkable realism and creativity. Whether you're looking to enhance your designs, create personalized visual content, or explore artistic possibilities, our AI model offers a versatile and intuitive solution. Seamlessly integrate generated images into your projects, advertisements, presentations, and more, and captivate your audience with captivating visuals that stand out. With our image generation AI, the possibilities for creativity are endless, empowering you to bring your vision to life with ease and precision.",
                 isAvailable: false,
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}