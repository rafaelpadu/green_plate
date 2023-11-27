import 'package:flutter/material.dart';
import 'package:green_plate/main.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/domain/model/DTOs/customer_dto.dart';
import 'package:green_plate/src/presentation/features/main/application/more_info_service.dart';
import 'package:green_plate/src/utils/case_formatters.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/mask_formatters.dart';
import 'package:green_plate/src/utils/toast_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.customerDTO});
  final CustomerDTO customerDTO;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final maskPhone = MasksFormaters().phoneMask;
  final maskCpf = MasksFormaters().maskCpf;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    populateFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 100),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Nome Completo',
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: ThemeColors.primaryFontColor,
                        ),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        controller: _cpfController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'CPF',
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: ThemeColors.primaryFontColor,
                          ),
                          fillColor: ThemeColors.textFieldBackGround,
                          filled: true,
                        ),
                        inputFormatters: [maskCpf],
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Telefone Celular',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: ThemeColors.primaryFontColor,
                        ),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                      inputFormatters: [maskPhone],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                Material(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColors.primary,
                    child: InkWell(
                      onTap: updateCustomer,
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(
                              'Salvar',
                              style: TextStyle(fontSize: 20, color: ThemeColors.whiteFontColor),
                            ),
                            Icon(
                              Icons.save_outlined,
                              color: ThemeColors.whiteFontColor,
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void populateFields() {
    _fullNameController.text = widget.customerDTO.fullName;
    _phoneController.text = widget.customerDTO.phone;
    if (widget.customerDTO.cpf != null) {
      _cpfController.text = CaseFormatters().formatarCPF(widget.customerDTO.cpf.toString());
    }
  }

  void updateCustomer() {
    widget.customerDTO.fullName = _fullNameController.text;
    widget.customerDTO.phone = _phoneController.text;
    if (_cpfController.text.isNotEmpty) {
      widget.customerDTO.cpf = CaseFormatters().desformatarCPF(_cpfController.text);
    }
    MoreInfoService moreInfoService = MoreInfoService();
    LoadingService.show(context);
    moreInfoService.updateCustomer(widget.customerDTO).then((value) {
      LoadingService.hide();
      ToastService.success('Conta atualizada com sucesso');
    }).catchError((err) {
      LoadingService.hide();
      ToastService.error(
          err is GreenPlateException ? err.message : "Ocorreu um erro no sistema. Tente novamente mais tarde");
    });
  }
}
