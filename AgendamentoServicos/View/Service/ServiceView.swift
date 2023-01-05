//
//  ServiceView.swift
//  AgendamentoServicos
//
//  Created by unicred on 02/01/23.
//

import UIKit

class ServiceView: UIView {
	var sendService: (Service) -> Void = { _ in }
	
	let userViewModel = UserViewModel.shared
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Register a Service"
		uiLabel.textColor = .tintColor
		uiLabel.font = .boldSystemFont(ofSize: 30)
		uiLabel.textAlignment = .center
		
		return uiLabel
	}()
	
	lazy var serviceFormView = {
		let view = ServiceFormView()
		
		return view
	}()
	
	lazy var registerButton: UIButton = {
		let uiButton = UIButton(configuration: .filled())
		
		uiButton.setTitle("Register", for: .normal)
		uiButton.addTarget(self, action: #selector(registerService), for: .touchUpInside)
		
		return uiButton
	}()
	
	lazy var addressFormView: AddressFormView = {
		let view = AddressFormView()
		
		print(userViewModel.getUser()?.address)
		view.address = userViewModel.getUser()?.address
		
		return view
	}()
	
	func setup(mode: ServiceMode) {
		addSubviews(serviceFormView, addressFormView, registerButton)
		serviceFormView.setup(mode: mode)
		addressFormView.setup {
			
		}
	}
	
	func setupConstraints() {
		serviceFormView.anchor(
			top: safeAreaLayoutGuide.topAnchor,
			leading: safeAreaLayoutGuide.leadingAnchor,
			bottom: safeAreaLayoutGuide.bottomAnchor,
			trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 10, left: 30, bottom: 0, right: 30),
			size: .init(width: frame.width - 100, height: 150)
		)
		
//		serviceFormView.anchorCenterX(to: centerXAnchor)
		
		serviceFormView.setupConstraints()
		
		addressFormView.anchor(
			top: serviceFormView.modeMenuButton.bottomAnchor,
				leading: safeAreaLayoutGuide.leadingAnchor,
				bottom: safeAreaLayoutGuide.bottomAnchor,
				trailing: safeAreaLayoutGuide.trailingAnchor,
			padding: .init(top: 10, left: 30, bottom: 0, right: 30)
		)

		addressFormView.setupConstraints()
		
		registerButton.anchor(
			bottom: safeAreaLayoutGuide.bottomAnchor,
			padding: .init(top: 0, left: 0, bottom: 20, right: 0),
			size: .init(width: 150, height: 0)
		)
		
		registerButton.anchorCenterX(to: centerXAnchor)
	}
	
	@objc func registerService() {
		let start = serviceFormView.datePicker.date
		let mode = serviceFormView.mode
		
		let address = Address(
			street: addressFormView.streetTextField.text!,
			district: addressFormView.districtTextField.text!,
			city: addressFormView.cityTextField.text!,
			cep: addressFormView.cepTextField.text!,
			state: addressFormView.stateTextField.text!,
			country: addressFormView.countryTextField.text!
		)
		
		sendService(.init(start: start, mode: mode, address: address, userEmail: UserViewModel.shared.getUser()!.email))
	}
}
