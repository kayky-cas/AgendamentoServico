//
// Created by Kayky Casagrande on 28/12/22.
//

// Nome Completo, data de nascimento, CPF, RG, Logradouro, Bairro, Cidade, CEP, Estado e País, Número de celular, e email.

import UIKit

class SignUpView: UIView {
    var navigateTo: () -> Void = {
    }

    lazy var titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "Sign Up"
        uiLabel.textColor = .tintColor
        uiLabel.font = .boldSystemFont(ofSize: 30)
        uiLabel.textAlignment = .center
        return uiLabel
    }()

    lazy var userFormView: UserFormView = UserFormView()
    lazy var loginFormView: LoginFormView = LoginFormView()
    lazy var addressFormView: AddressFormView = AddressFormView()

    lazy var signUpButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Register account", for: .normal)
        uiButton.addTarget(self, action: #selector(signUpButtonTouchUpInside), for: .touchUpInside)

		uiButton.isEnabled = false
		
        return uiButton
    }()

    func setup(navigateTo: @escaping () -> Void) {
        self.navigateTo = navigateTo

        addSubviews(titleLabel, userFormView, loginFormView, addressFormView, signUpButton)
		
        userFormView.setup(onChange: onChange)
        loginFormView.setup(onChange: onChange)
        addressFormView.setup(onChange: onChange)
    }

    func setupConstraints() {
        let formPadding = UIEdgeInsets(top: 20, left: 23, bottom: 0, right: 23)

        titleLabel.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor
        )

        userFormView.anchor(
                top: titleLabel.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: formPadding
        )

        userFormView.setupConstraints()

        loginFormView.anchor(
                top: userFormView.phoneTextField.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: formPadding
        )

        loginFormView.setupConstraints()

        addressFormView.anchor(
                top: loginFormView.passwordTextField.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: formPadding
        )

        addressFormView.setupConstraints()

        signUpButton.anchor(
                bottom: safeAreaLayoutGuide.bottomAnchor,
                padding: .init(top: 0, left: 0, bottom: 30, right: 0)
        )

        signUpButton.anchorCenterX(to: centerXAnchor)
    }

    func onChange() {
		signUpButton.isEnabled = userFormView.isValid && addressFormView.isValid && loginFormView.isValid
    }
	
	@objc func signUpButtonTouchUpInside() {
		let user = User(
			name: userFormView.nameTextField.text!,
			birthDate: userFormView.birthDatePicker.date,
			cpf: userFormView.cpfTextField.text!,
			rg: userFormView.rgTextField.text!,
			street: addressFormView.streetTextField.text!,
			district: addressFormView.districtTextField.text!,
			city: addressFormView.cityTextField.text!,
			cep: addressFormView.cepTextField.text!,
			state: addressFormView.stateTextField.text!,
			country: addressFormView.countryTextField.text!,
			phone: userFormView.phoneTextField.text!,
			email: loginFormView.emailTextField.text!,
			password: loginFormView.passwordTextField.text!
		)
		
		UserViewModel.shared.addUser(user: user)
		
		navigateTo()
	}
}
