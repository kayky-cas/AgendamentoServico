//
// Created by Kayky Casagrande on 28/12/22.
//

import UIKit

class LoginView: UIView {
	let userViewModel = UserViewModel.shared
	
    @objc var navigateToSignUp: () -> Void = {
    }
	
	@objc var navigateToHome: () -> Void = {
    }
	
	
	lazy var logoImageView: UIImageView = {
		let imageView = UIImageView()
							
		imageView.image = UIImage(systemName: "trash.fill")
		imageView.contentMode = .scaleAspectFit
		
		return imageView
	}()

    lazy var emailTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Email address"
		uiTextField.autocorrectionType = .no
		uiTextField.autocapitalizationType = .none
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

		
        return uiTextField
    }()

    lazy var passwordTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Password"
        uiTextField.isSecureTextEntry = true
		uiTextField.autocorrectionType = .no
		uiTextField.autocapitalizationType = .none
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()
	
	lazy var forgotLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Dou you forgot your password?"
		uiLabel.textColor = .systemGray2
		uiLabel.textAlignment = .right
		uiLabel.font = .systemFont(ofSize: 13)
		
		return uiLabel
	}()

    lazy var loginButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Enter", for: .normal)
		uiButton.addTarget(self, action: #selector(homeTouchUpInside), for: .touchUpInside)
		uiButton.isEnabled = false

        return uiButton
    }()

    lazy var signUpLabel: UILabel = {
        let uiLabel = UILabel()

        let fontSize = 15.0

        let normalText = "If you don't have an account click here to "
        let normalTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)
        ]

        let normalTextAttrString = NSAttributedString(string: normalText, attributes: normalTextAttr)

        let signUpText = "Sign Up"
        let signUpTextAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.tintColor,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)
        ]

        let signUpTextAttrString = NSAttributedString(string: signUpText, attributes: signUpTextAttr)

        let attributedText = NSMutableAttributedString()
        attributedText.append(normalTextAttrString)
        attributedText.append(signUpTextAttrString)

        uiLabel.attributedText = attributedText

        uiLabel.numberOfLines = 0

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpTouchUpInside))

        uiLabel.addGestureRecognizer(tapGestureRecognizer)
        uiLabel.isUserInteractionEnabled = true

        return uiLabel
    }()

	func setup(toSignUp: @escaping () -> (), toHome: @escaping () -> Void) {
        navigateToSignUp = toSignUp
		navigateToHome = toHome

        addSubviews(logoImageView, emailTextField, passwordTextField, loginButton, signUpLabel, forgotLabel)
    }

    func setupConstraints() {

        let textFieldSize = CGSize(width: 0, height: 30)
		
		
		logoImageView.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0),
				size: .init(width: frame.width, height: 150)
        )
		
        emailTextField.anchor(
                top: logoImageView.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 80, left: 30, bottom: 20, right: 30),
                size: textFieldSize
        )

        passwordTextField.anchor(
                top: emailTextField.bottomAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 20, left: 30, bottom: 0, right: 30),
                size: textFieldSize
        )
		
		forgotLabel.anchor(
			top: passwordTextField.bottomAnchor,
			trailing: passwordTextField.trailingAnchor,
			padding: .init(top: 5, left: 0, bottom: 0, right: 5)
		)

        signUpLabel.anchor(
                bottom: safeAreaLayoutGuide.bottomAnchor,
                padding: .init(top: 0, left: 0, bottom: 30, right: 0),
                size: .init(width: 250, height: 0)
        )

        signUpLabel.anchorCenterX(to: centerXAnchor)

        loginButton.anchor(
                bottom: signUpLabel.topAnchor,
                padding: .init(top: 0, left: 0, bottom: 20, right: 0),
				size: .init(width: 150, height: 0)
        )

        loginButton.anchorCenterX(to: centerXAnchor)
    }

    @objc func signUpTouchUpInside() {
        navigateToSignUp()
    }
	
	@objc func homeTouchUpInside() {
		if userViewModel.login(email: emailTextField.text!, password: passwordTextField.text!) {
			navigateToHome()
		}
	}
	
	@objc func textFieldDidChange() {
		if (emailTextField.text ?? "" != "" && passwordTextField.text ?? "" != "") {
			loginButton.isEnabled = true
			return
		}
		
		loginButton.isEnabled = false
	}
}
