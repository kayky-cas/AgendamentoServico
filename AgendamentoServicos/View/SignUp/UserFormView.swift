//
// Created by Kayky Casagrande on 29/12/22.
//

import UIKit

class UserFormView: UIView {
	var onChange: () -> Void = { }
	
	var isValid = false
	
    lazy var profileInfoLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Profile info:"
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var nameTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Full name"
        uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var birthDateLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = " Birth date:"
        uiLabel.textColor = .lightGray

        return uiLabel
    }()

    lazy var birthDatePicker: UIDatePicker = {
        let uiDatePicker = UIDatePicker()

        uiDatePicker.datePickerMode = .date

        return uiDatePicker
    }()

    lazy var cpfTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "CPF"
        uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var rgTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "RG"
        uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var phoneTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Phone number"
        uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    func setup(onChange: @escaping () -> Void) {
        self.onChange = onChange

        addSubviews(
                profileInfoLabel,
                nameTextField,
                birthDateLabel,
                birthDatePicker,
                cpfTextField,
                rgTextField,
                phoneTextField
        )
    }

    func setupConstraints() {

        let userInfoPadding = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)

        profileInfoLabel.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: userInfoPadding
        )

        nameTextField.anchor(
                top: profileInfoLabel.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )

        birthDatePicker.anchor(
                top: nameTextField.bottomAnchor,
                leading: nil,
                trailing: trailingAnchor,
                padding: userInfoPadding
        )

        birthDateLabel.anchor(
                top: nameTextField.bottomAnchor,
                leading: leadingAnchor,
                bottom: birthDatePicker.bottomAnchor,
                trailing: birthDatePicker.leadingAnchor,
                padding: userInfoPadding
        )

        cpfTextField.anchor(
                top: birthDatePicker.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 5)
        )

        rgTextField.anchor(
                top: birthDatePicker.bottomAnchor,
                leading: cpfTextField.trailingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 5, bottom: 0, right: 0)
        )

        phoneTextField.anchor(
                top: rgTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: userInfoPadding
        )
    }

    @objc func textFieldDidChange() {
		isValid = [
            nameTextField,
            cpfTextField,
            rgTextField,
            phoneTextField
        ].first {
            $0.text == ""
        } == nil
		
		print("User \(isValid)")

        onChange()
    }
}
