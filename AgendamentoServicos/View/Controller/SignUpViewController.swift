//
// Created by Kayky Casagrande on 28/12/22.
//

import UIKit

class SignUpViewController: BaseViewController {
    let signUpView = SignUpView()

    override func loadView() {
        super.loadView()

        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationController?.isNavigationBarHidden = false

        signUpView.setup {
            self.backToRoot()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        signUpView.setupConstraints()
    }

    func backToRoot() {
		navigationController?.popToRootViewController(animated: true)
    }
}
