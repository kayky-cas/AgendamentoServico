//
//  HomeView.swift
//  AgendamentoServicos
//
//  Created by unicred on 02/01/23.
//

import UIKit

class HomeView: UIView {
	var navigateTo: (ServiceMode) -> Void = {_ in }
	var logout: () -> Void = {  }
	
	lazy var titleLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Choose the Service"
		uiLabel.textColor = .tintColor
		uiLabel.textAlignment = .center
		uiLabel.font = .boldSystemFont(ofSize: 35)
		
		return uiLabel
	}()
	
	lazy var easyServiceCardView: SeviceCardView = {
		let serviceCardView = SeviceCardView()
		
		serviceCardView.setup(imageName: "easy", labelText: "Easy service")
		serviceCardView.navigateTo = open(.easy)
		
		return serviceCardView
	}()
	
	lazy var mediumServiceCardView: SeviceCardView = {
		let serviceCardView = SeviceCardView()
		
		serviceCardView.setup(imageName: "medium", labelText: "Medium service")
		serviceCardView.navigateTo = open(.medium)
		
		return serviceCardView
	}()
	
	lazy var hardServiceCardView: SeviceCardView = {
		let serviceCardView = SeviceCardView()
		
		serviceCardView.setup(imageName: "hard", labelText: "Hard service")
		serviceCardView.navigateTo = open(.hard)
		
		return serviceCardView
	}()
	
	lazy var logoutButton: UIButton = {
		let uiButton = UIButton()
		
		uiButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
		uiButton.setTitle("Logout", for: .normal)
		uiButton.setTitleColor(.tintColor, for: .normal)
		uiButton.addTarget(self, action: #selector(logoutButtonTouchUpInside), for: .touchUpInside)
		
		return uiButton
	}()
	
	func setup() {
		addSubviews(logoutButton, titleLabel, easyServiceCardView, mediumServiceCardView, hardServiceCardView)
	}
	
	func setupConstraints() {
		let padding = 25.0
		let cardHeight = 90.0
		let cardWidth = frame.width - 30
		
		logoutButton.anchor(
			top: topAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 60, left: 0, bottom: 0, right: 30)

		)
		
		titleLabel.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 100, left: 0, bottom: 0, right: 0)
		)
		
		mediumServiceCardView.anchor(
			size: .init(width: cardWidth, height: cardHeight)
		)
		
		mediumServiceCardView.anchorCenterX(to: centerXAnchor)
		mediumServiceCardView.anchorCenterY(to: centerYAnchor)
		mediumServiceCardView.setupConstraints(height: cardHeight)
		
		easyServiceCardView.anchor(
			bottom: mediumServiceCardView.topAnchor,
			padding: .init(top: 0, left: 0, bottom: padding, right: 0),
			size: .init(width: cardWidth, height: cardHeight)
		)
		
		easyServiceCardView.anchorCenterX(to: centerXAnchor)
		easyServiceCardView.setupConstraints(height: cardHeight)
		
		hardServiceCardView.anchor(
			top: mediumServiceCardView.bottomAnchor,
			padding: .init(top: padding, left: 0, bottom: 0, right: 0),
			size: .init(width: cardWidth, height: cardHeight)
		)
		
		hardServiceCardView.anchorCenterX(to: centerXAnchor)
		hardServiceCardView.setupConstraints(height: cardHeight)
	}
	
	func open(_ mode: ServiceMode) -> () -> Void {
		return {
			self.navigateTo(mode)
		}
	}
	
	@objc func logoutButtonTouchUpInside() {
		UserViewModel.shared.logout()
		logout()
	}
}
