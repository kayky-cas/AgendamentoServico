//
//  ViewController.swift
//  Agendamento
//
//  Created by Kayky Casagrande on 27/12/22.
//
//

import UIKit


class LoginViewController: BaseViewController {
    let loginView = LoginView()

    override func loadView() {
        super.loadView()
        view = loginView
    }
	
	override func viewDidAppear(_ animated: Bool) {
		loginView.passwordTextField.text = ""
		loginView.loginButton.isEnabled = false
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		loginView.setup(toSignUp: navigateToSignUp, toHome: navigateToHome)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        loginView.setupConstraints()
    }

    func navigateToSignUp() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
	
	func navigateToHome() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
