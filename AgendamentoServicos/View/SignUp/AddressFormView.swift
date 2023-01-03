//
// Created by Kayky Casagrande on 29/12/22.
//

import UIKit

class AddressFormView: UIView {
	var onChange: () -> Void = { }
	
	var isValid = false
	
    lazy var addressLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Address info:"
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var streetTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Street"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var districtTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "District"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var cityTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "City"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var cepTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "CEP"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var stateTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "State"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

    lazy var countryTextField: BaseUITextField = {
        let uiTextField = BaseUITextField()

        uiTextField.placeholder = "Country"
		uiTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return uiTextField
    }()

	func setup(onChange: @escaping () -> Void) {
		self.onChange = onChange

        addSubviews(
                addressLabel,
                streetTextField,
                districtTextField,
                cityTextField,
                cepTextField,
                stateTextField,
                countryTextField
        )
    }

    func setupConstraints() {

        addressLabel.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 0)
        )

        streetTextField.anchor(
                top: addressLabel.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 5, left: 0, bottom: 0, right: 5)
        )

        districtTextField.anchor(
                top: addressLabel.bottomAnchor,
                leading: streetTextField.trailingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 5, left: 5, bottom: 0, right: 0)
        )

        cepTextField.anchor(
                top: districtTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 5)
        )

        cityTextField.anchor(
                top: districtTextField.bottomAnchor,
                leading: streetTextField.trailingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 5, bottom: 0, right: 0)
        )

        stateTextField.anchor(
                top: cityTextField.bottomAnchor,
                leading: leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 10, left: 0, bottom: 0, right: 5)
        )

        countryTextField.anchor(
                top: cityTextField.bottomAnchor,
                leading: streetTextField.trailingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 10, left: 5, bottom: 0, right: 0)
        )
    }
	
	@objc func textFieldDidChange() {
		isValid = [
			streetTextField,
			districtTextField,
			cityTextField,
			cepTextField,
			stateTextField,
			countryTextField
		].first {
			$0.text == ""
		} == nil
		
		print("Address \(isValid)")

		onChange()
	}
}
