import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/data/services/auth_service_impl.dart';
import 'package:o2o_point_configuration/presentation/controllers/configuration_controller.dart';
import 'package:o2o_point_configuration/presentation/controllers/token_controller.dart';
import 'package:o2o_point_configuration/presentation/widgets/fab.dart';
import 'package:o2o_point_configuration/presentation/widgets/layout/left_panel_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/dialog_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/member_list_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/member_title_list_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/title_and_search_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/point/select_duration_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/point/text_inputs_widget.dart';
import 'package:o2o_point_configuration/presentation/widgets/point/toggle_selection_widget.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';
import 'package:o2o_point_configuration/utils/utils.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

  final Map<String, dynamic> queryParameters;

  const MainPage({Key? key, required this.queryParameters}) : super(key: key);
}

class _MainPageState extends State<MainPage> {
  /// admin 에 들어가는 동안에는 기본값 hide
  bool _isLeftPanelShown = true;
  bool isMemberClick = true;

  bool meaningless = false; // 나중에 삭제

  final ConfigurationController configurationPageController =
      Get.find<ConfigurationController>();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final tc = Get.put(TokenController());

  void _toggleLeftPanel() {
    setState(() {
      _isLeftPanelShown = !_isLeftPanelShown;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeFromUrl();
    });
  }

  Future<void> _initializeFromUrl() async {
    final id = widget.queryParameters['id'] ?? "";
    final token = widget.queryParameters['v'];

    if (id.isNotEmpty) {
      if (token == null || token.isEmpty) {
        // Use id and password with login function
        await AuthServiceImpl().login(id, widget.queryParameters['pass']);
      } else {
        // Use token with firebaseLogin
        await AuthServiceImpl().firebaseLogin(token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(toggleLeftPanel: _toggleLeftPanel),
      body: SizedBox(
        // 감춘거1
         height: currentScreenHeight(context),
        child: Stack(
          children: [
            buildBody(context),
            isMemberClick ? _addMemberButton() : _buildFloatingActionButton(),
            // _buildLoadingOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    final ConfigurationController configurationController =
        Get.find<ConfigurationController>();

    return Obx(() {
      if (configurationController.isLoading.value) {
        return Container(
          color: Colors.black.withOpacity(0.5),
          // Adjust the background color and opacity
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryOrange,
            ), // Use your preferred loading indicator
          ),
        );
      } else {
        return const SizedBox
            .shrink(); // Return an empty widget when isLoading is false
      }
    });
  }

  Widget _buildFloatingActionButton() {
    bool isMobile = isMobileDevice(context);
    return Positioned(
      bottom: isMobile ? 8 : 42,
      right: isMobile ? 8 : 42,
      child: Container(
        child: CustomFAB(
          onPressed: () {
            if (_key.currentState!.validate()) {
              // print("validated");
              configurationPageController.submitData(context);
            }
          },
          child: const Text(
            "저장",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _addMemberButton() {
    bool isMobile = isMobileDevice(context);

    return Positioned(
        bottom: isMobile ? 8 : 42,
        right: isMobile ? 8 : 42,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const DialogWidget();
              },
            );
          },
          child: Container(
            width: 112,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: AppColors.primaryOrange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  '회원 등록',
                  style: O2OTheme.darkTheme(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(height: 1.1),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildBody(BuildContext context) {
    bool isMobile = isMobileDevice(context);

    return isMobile
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ToggleSelectionWidget(),
                      SelectDurationWidget(),
                      TextInputsWidget(
                        formKey: _key,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : isMemberClick
            ? Row(
                children: [
                  // 감춘거 2
                  Expanded(
                    flex: 2,
                    child: Visibility(
                      visible: _isLeftPanelShown,
                      child: Flexible(
                        child: LayoutBuilder(
                          builder: (_, constraints) =>
                              LeftPanelWidget(constraints: constraints),
                        ),
                      ),
                    ),
                  ),
                  meaningless
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 23, bottom: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleAndSearchWidget(),
                              const SizedBox(
                                height: 39,
                              ),
                              Container(
                                width: 1640,
                                height: 800,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.textfieldBorderColor,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const MemberTitleListWidget(),
                                    Container(
                                      color: AppColors.defaultGrey2Color,
                                      height: 1,
                                    ),
                                    Expanded(
                                      child: ListView(
                                        children: List.generate(
                                          20,
                                          (index) => const MemberListWidget(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 23, bottom: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleAndSearchWidget(),
                              const SizedBox(
                                height: 39,
                              ),
                              Container(
                                width: 1640,
                                height: 800,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.textfieldBorderColor,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const MemberTitleListWidget(),
                                    Container(
                                      color: AppColors.defaultGrey2Color,
                                      height: 1,
                                    ),
                                    Expanded(
                                      child: ListView(
                                        children: List.generate(
                                          20,
                                          (index) => const MemberListWidget(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                ],
              )
            : Row(
                children: [
                  Visibility(
                    visible: _isLeftPanelShown,
                    child: Flexible(
                      child: LayoutBuilder(
                        builder: (_, constraints) =>
                            LeftPanelWidget(constraints: constraints),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ToggleSelectionWidget(),
                            SelectDurationWidget(),
                            TextInputsWidget(
                              formKey: _key,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }

  final int _selectedValue = 1;
}
