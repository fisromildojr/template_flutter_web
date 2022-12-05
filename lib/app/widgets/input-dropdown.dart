import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:template_flutter_web/app/model/api/abstract_entity_model.dart';
import 'package:template_flutter_web/app/utils/constants.dart';
import 'package:template_flutter_web/app/utils/responsive.dart';
import 'package:template_flutter_web/app/widgets/dropdown_search/dropdown_search.dart';
import 'package:template_flutter_web/app/widgets/text-body.dart';

class InputDropdown<T extends AbstractEntity> extends StatelessWidget {
  final Key? key;
  final double? width;
  final String? name;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function(T?)? onChanged;
  final void Function()? loadDropdown;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool autofocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool validator;
  final bool show;
  final bool enabled;
  final bool showLabel;
  final bool autoFocus;
  final List<T>? items;
  final T? selectedItem;
  final bool awaitingSelection;
  final bool cleanItems;
  final Future<List<T>?>? futureItems;

  InputDropdown({
    this.key,
    this.width,
    this.name,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.validator = true,
    this.show = false,
    this.enabled = true,
    this.showLabel = true,
    this.autoFocus = false,
    this.items,
    this.selectedItem,
    this.awaitingSelection = false,
    this.cleanItems = false,
    this.futureItems,
    this.loadDropdown,
  });

  Future<List<T>?> getItems() async {
    return await futureItems;
  }

  // loadDropdown() {}

  @override
  Widget build(BuildContext context) {
    return show
        ? Container(
            padding:
                width != null ? null : const EdgeInsets.all(defaultPadding),
            constraints: width == null
                ? null
                : const BoxConstraints(minWidth: defaultTextShowContentWidth),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding / 2),
                  child: TextBody(
                    name?.replaceAll('*', '') ?? '',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextBody(
                  selectedItem == null ? '-' : selectedItem!.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        : futureItems != null
            ? FutureBuilder<List<T>?>(
                future: futureItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var data = snapshot.data;
                    return Container(
                      width: width ??
                          (Responsive.isDesktop(context)
                              ? widthDefaultInput
                              : Get.width - defaultPadding / 2),
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (name != null && showLabel)
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: defaultPadding / 2),
                              child: TextBody(
                                name! + (validator ? "*" : ""),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          DropdownSearch<T>(
                            mode: dropDownMode,
                            loadDropdown: loadDropdown,
                            autoFocus: autoFocus,
                            enabled: awaitingSelection ? false : enabled,
                            showSearchBox: true,
                            //showSelectedItem: true,
                            itemAsString: (T? value) => value.toString(),
                            items: data,
                            dropdownSearchDecoration: InputDecoration(
                              suffixIcon: suffixIcon,
                              prefixIcon: prefixIcon,
                              hintText: awaitingSelection
                                  ? 'Aguardando seleção...'
                                  : 'Selecione...',
                            ).applyDefaults(
                                Theme.of(context).inputDecorationTheme),
                            onChanged: onChanged,
                            selectedItem: selectedItem,
                            validator: (value) => (validator)
                                ? (value == null)
                                    ? 'Selecione uma opção...'
                                    : null
                                : null,
                            emptyBuilder: (context, searchEntry) => Center(
                              child: TextBody(
                                awaitingSelection
                                    ? 'Aguardando seleção...'
                                    : 'Não cadastrado',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container(
                    width: width ??
                        (Responsive.isDesktop(context)
                            ? widthDefaultInput
                            : Get.width - defaultPadding / 2),
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (name != null && showLabel)
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: defaultPadding / 2),
                            child: TextBody(
                              name! + (validator ? "*" : ""),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        DropdownSearch<T>(
                          mode: dropDownMode,
                          // loadDropdown: loadDropdown,
                          autoFocus: autoFocus,
                          enabled: selectedItem == null ? false : true,
                          showSearchBox: true,
                          //showSelectedItem: true,
                          items: null,
                          // dropdownSearchTextAlignVertical:
                          //     const TextAlignVertical(y: 0.6),
                          dropdownSearchDecoration: InputDecoration(
                            suffixIcon: suffixIcon,
                            prefixIcon: prefixIcon,
                            hintText: 'Carregando...',
                          ).applyDefaults(
                              Theme.of(context).inputDecorationTheme),
                          onChanged: null,
                          selectedItem: selectedItem,
                        ),
                      ],
                    ),
                  );
                })
            : Container(
                width: width ??
                    (Responsive.isDesktop(context)
                        ? widthDefaultInput
                        : Get.width - defaultPadding / 2),
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (name != null && showLabel)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: defaultPadding / 2),
                        child: TextBody(
                          name! + (validator ? "*" : ""),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    DropdownSearch<T>(
                      mode: dropDownMode,
                      // loadDropdown: loadDropdown,
                      autoFocus: autoFocus,
                      enabled: awaitingSelection ? false : enabled,
                      showSearchBox: true,
                      //showSelectedItem: true,
                      itemAsString: (T? value) => value.toString(),
                      items: items,
                      // dropdownSearchTextAlignVertical:
                      //     const TextAlignVertical(y: 0.6),
                      searchFieldProps: TextFieldProps(
                        style: const TextStyle(
                          fontSize: fontSizeInputs,
                        ),
                      ),
                      dropdownSearchDecoration: InputDecoration(
                        suffixIcon: suffixIcon,
                        prefixIcon: prefixIcon,
                        hintText: awaitingSelection
                            ? 'Aguardando seleção...'
                            : 'Selecione...',
                      ).applyDefaults(Theme.of(context).inputDecorationTheme),

                      onChanged: onChanged,
                      selectedItem: selectedItem,
                      validator: (value) => (validator)
                          ? (value == null)
                              ? 'Selecione uma opção...'
                              : null
                          : null,
                      emptyBuilder: (context, searchEntry) => Center(
                        child: TextBody(
                          awaitingSelection
                              ? 'Aguardando seleção...'
                              : 'Não cadastrado',
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
