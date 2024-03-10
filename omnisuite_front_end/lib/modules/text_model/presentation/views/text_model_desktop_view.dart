import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnisuite_front_end/config/router/app_router.dart';
import 'package:omnisuite_front_end/config/router/app_router.gr.dart';
import 'package:omnisuite_front_end/modules/text_model/domain/entities/message_attributes_model.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_bloc.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_event.dart';
import 'package:omnisuite_front_end/modules/text_model/presentation/bloc/text_generation_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TextGenerationBloc>(),
      child: BlocConsumer<TextGenerationBloc, TextGenerationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: OmniSuiteColors.primary,
            appBar: AppBar(
              backgroundColor: OmniSuiteColors.primary,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                color: OmniSuiteColors.white,
                onPressed: () =>
                    locator<AppRouter>().replace(const LandingRoute()),
              ),
              centerTitle: true,
              title: const Center(
                child: Text(
                  "TEXT GENERATION AI",
                  style: OmniSuiteTextStyle.subheadingH4,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(
                  double.infinity,
                  20,
                ),
                child: Divider(
                  indent: UIHelpers.screenWidth(context) * 0.2,
                  endIndent: UIHelpers.screenWidth(context) * 0.2,
                ),
              ),
            ),
            body: Column(
              children: [
                UIHelpers.verticalSpaceRegular,
                Expanded(
                  flex: 9,
                  child: SizedBox(
                    width: UIHelpers.screenWidth(context) * 0.5,
                    child: ListView.separated(
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: BlocProvider.of<TextGenerationBloc>(
                                    context,
                                    listen: true)
                                .conversations[index]
                                .isBot
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          MessageTileWidget(
                            profileImage: BlocProvider.of<TextGenerationBloc>(
                                        context,
                                        listen: true)
                                    .conversations[index]
                                    .profile ??
                                "assets/images/omni-suite_logo.png",
                            prompt: BlocProvider.of<TextGenerationBloc>(context,
                                        listen: true)
                                    .conversations[index]
                                    .prompt ??
                                "",
                            isBot: BlocProvider.of<TextGenerationBloc>(context,
                                    listen: true)
                                .conversations[index]
                                .isBot,
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) =>
                          UIHelpers.verticalSpaceSmall,
                      itemCount: BlocProvider.of<TextGenerationBloc>(context,
                              listen: true)
                          .conversations
                          .length,
                    ),
                  ),
                ),
                UIHelpers.verticalSpaceRegular,
                BlocConsumer<TextGenerationBloc, TextGenerationState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Expanded(
                      child: CustomTextField(
                        controller: BlocProvider.of<TextGenerationBloc>(context)
                            .promptController,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        enabled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: OmniSuiteColors.hintColor,
                            width: 1,
                          ),
                        ),
                        onFieldSubmitted: state is TextGenerationLoadingState
                            ? null
                            : (p0) {
                                if (p0 != " " && p0.isNotEmpty) {
                                  BlocProvider.of<TextGenerationBloc>(context)
                                      .add(
                                    GenerateTextEvent(
                                      messageAttributesModel:
                                          MessageAttributesModel(
                                        profile:
                                            "assets/images/omni-suite_logo.png",
                                        prompt:
                                            BlocProvider.of<TextGenerationBloc>(
                                                    context)
                                                .promptController
                                                .text,
                                        isBot: false,
                                      ),
                                    ),
                                  );
                                  BlocProvider.of<TextGenerationBloc>(context)
                                      .promptController
                                      .clear();
                                  FocusScope.of(context).unfocus();
                                }
                              },
                        suffixIcon: InkWell(
                          onTap: state is TextGenerationLoadingState
                              ? null
                              : () {
                                  if (BlocProvider.of<TextGenerationBloc>(
                                                  context)
                                              .promptController
                                              .text !=
                                          " " &&
                                      BlocProvider.of<TextGenerationBloc>(
                                              context)
                                          .promptController
                                          .text
                                          .isNotEmpty) {
                                    BlocProvider.of<TextGenerationBloc>(context)
                                        .add(
                                      GenerateTextEvent(
                                        messageAttributesModel:
                                            MessageAttributesModel(
                                          profile:
                                              "assets/images/omni-suite_logo.png",
                                          prompt: BlocProvider.of<
                                                  TextGenerationBloc>(context)
                                              .promptController
                                              .text,
                                          isBot: false,
                                        ),
                                      ),
                                    );
                                    BlocProvider.of<TextGenerationBloc>(context)
                                        .promptController
                                        .clear();
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                          splashColor: OmniSuiteColors.transparent,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                UIHelpers.verticalSpaceSmall,
              ],
            ),
          );
        },
      ),
    );
  }
}
