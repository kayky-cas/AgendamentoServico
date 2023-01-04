//
//  ServiceView.swift
//  AgendamentoServicos
//
//  Created by unicred on 02/01/23.
//

import UIKit

class ServiceView: UIView {
	var sendService: (Service) -> Void = { _ in }
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Register a Service"
		uiLabel.textColor = .tintColor
		uiLabel.font = .boldSystemFont(ofSize: 35)
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
	
	func setup(mode: ServiceMode) {
		addSubviews(titleLabel, serviceFormView, registerButton)
		serviceFormView.setup(mode: mode)
	}
	
	func setupConstraints() {
		titleLabel.anchor(
			top: safeAreaLayoutGuide.topAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 30, left: 0, bottom: 0, right: 0)
		)
		
		serviceFormView.anchor(
			top: titleLabel.bottomAnchor,
			padding: .init(top: 20, left: 0, bottom: 0, right: 0),
			size: .init(width: frame.width - 100, height: 150)
		)
		
		serviceFormView.anchorCenterX(to: centerXAnchor)
		
		serviceFormView.setupConstraints()
		
		registerButton.anchor(
			bottom: safeAreaLayoutGuide.bottomAnchor,
			padding: .init(top: 0, left: 0, bottom: 40, right: 0),
			size: .init(width: 150, height: 0)
		)
		
		registerButton.anchorCenterX(to: centerXAnchor)
	}
	
	@objc func registerService() {
		let start = serviceFormView.datePicker.date
		let mode = serviceFormView.mode
		
		sendService(.init(start: start, mode: mode, userEmail: UserViewModel.shared.getUser()!.email))
	}
}
