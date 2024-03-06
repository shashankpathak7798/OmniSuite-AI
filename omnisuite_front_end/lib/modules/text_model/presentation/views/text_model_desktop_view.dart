import 'package:flutter/material.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/config/router/app_router.gr.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/entities/message_attributes_model.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/widgets/message_tile_widget.dart';
import 'package:omnisuite_front_end/services/locator.dart';
import 'package:omnisuite_front_end/utils/comman_widgets/custom_text_field.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_colors.dart';
import 'package:omnisuite_front_end/utils/components/omnisuite_typography.dart';
import 'package:omnisuite_front_end/utils/components/ui_helpers.dart';

class TextModelDesktopView extends StatefulWidget {
  const TextModelDesktopView({super.key});

  @override
  State<TextModelDesktopView> createState() => _TextModelDesktopViewState();
}

class _TextModelDesktopViewState extends State<TextModelDesktopView> {
  final TextEditingController searchQueryTextController = TextEditingController();

  List<MessageAttributesModel> conversation = [];

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      backgroundColor: OmniSuiteColors.primary,
      appBar: AppBar(
        backgroundColor: OmniSuiteColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30,),
          color: OmniSuiteColors.white,
          onPressed: () => locator<AppRouter>().replace(const LandingRoute()),
        ),
        centerTitle: true,
        title: const Center(child: Text("TEXT GENERATION AI", style: OmniSuiteTextStyle.subheadingH4,),),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 20,),
        child: Divider(
            indent: UIHelpers.screenWidth(context) * 0.2,
            endIndent: UIHelpers.screenWidth(context) * 0.2,
          ),),
      ),
      body: Column(
        children: [
          
          UIHelpers.verticalSpaceRegular,
          Expanded(child: SizedBox(
            width: UIHelpers.screenWidth(context) * 0.6,
            child: ListView.separated(itemBuilder: (context, index) => Row(
              mainAxisAlignment: conversation[index].isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                MessageTileWidget(profileImage: conversation[index].profile ?? "assets/images/omnisuite_logo.png", prompt: conversation[index].prompt ?? "", isBot: conversation[index].isBot,),
              ],
            ), separatorBuilder: (context, index) => UIHelpers.verticalSpaceSmall, itemCount: conversation.length,),
          ),),
          const Spacer(),
          CustomTextField(
            controller: searchQueryTextController,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20,),
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: OmniSuiteColors.hintColor,
                width: 1,
              ),
            ),
            onFieldSubmitted: (p0) {
              if(p0 != " " && p0.isNotEmpty) {
                conversation.add(MessageAttributesModel(
                  profile: "assets/images/omnisuite_logo.png",
                  prompt: p0,
                  isBot: false,
                ));
                searchQueryTextController.clear();
                FocusScope.of(context).unfocus();
              }
            },
            suffixIcon: InkWell(
              onTap: () {
                if(searchQueryTextController.text != " " && searchQueryTextController.text.isNotEmpty) {
                conversation.add(MessageAttributesModel(
                  profile: "assets/images/omnisuite_logo.png",
                  prompt: searchQueryTextController.text,
                  isBot: false,
                ),);
                searchQueryTextController.clear();
                FocusScope.of(context).unfocus();
                }
              },
              splashColor: OmniSuiteColors.transparent,
              child: const Icon(Icons.send, color: Colors.white,),),
          ),
          UIHelpers.verticalSpaceSmall,
        ],
      ),
    );
  }
}