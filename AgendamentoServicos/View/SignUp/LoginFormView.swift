//
// Created by Kayky Casagrande on 29/12/22.
//

import UIKit

class LoginFormView: UIView {
	var onChange: () -> Void = { }
	
	var isValid = false
	
    lazy var loginInfoLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Login info:"
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var emailTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Email address"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
		uiTextField.autocapitalizationType = .none

        return uiTextField
    }()

    lazy var passwordTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Password"
        uiTextField.isSecureTextEntry = true
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
		uiTextField.autocapitalizationType = .none

        return uiTextField
    }()

    lazy var confirmPasswordTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Confirm password"
        uiTextField.isSecureTextEntry = true
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
		uiTextField.autocapitalizationType = .none

        return uiTextField
    }()

	func setup(onChange: @escaping () -> Void) {
		self.onChange = onChange

        addSubviews(
                loginInfoLabel,
                emailTextField,
                passwordTextField,
                confirmPasswordTextField
        )
    }

    func setupConstraints() {
        loginInfoLabel.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 0)
        )

        emailTextField.anchor(
                top: loginInfoLabel.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )

        passwordTextField.anchor(
                top: emailTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 5)
        )

        confirmPasswordTextField.anchor(
                top: emailTextField.bottomAnchor,
                leading: passwordTextField.trailingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 5, bottom: 0, right: 0)
        )
    }
	
	@objc func textFieldDidChange() {
		isValid = [
			emailTextField,
			passwordTextField,
			confirmPasswordTextField
		].first {
			$0.text == ""
		} == nil && passwordTextField.text == confirmPasswordTextField.text
		
		onChange()
	}
}
