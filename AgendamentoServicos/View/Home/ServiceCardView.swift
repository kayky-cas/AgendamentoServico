//
//  ServiceCardView.swift
//  AgendamentoServicos
//
//  Created by unicred on 02/01/23.
//

import UIKit

class SeviceCardView: UIView {
	var navigateTo: () -> Void = {
	}
	
	lazy var tapView: UIView = {
		let view = UIView()
		
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(click))
		view.addGestureRecognizer(tapGestureRecognizer)
		view.isUserInteractionEnabled = true
		
		return view
	}()
	
	lazy var imageView: UIImageView = {
		let uiImageView = UIImageView()
		
		uiImageView.layer.borderColor = UIColor.tintColor.cgColor
		
		return uiImageView
	}()
	
	lazy var label: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textAlignment = .center
		uiLabel.textColor = .tintColor
		uiLabel.font = .boldSystemFont(ofSize: 22)
		
		return uiLabel
	}()
	
	func setup(imageName: String, labelText: String) {
		imageView.image = UIImage(named: imageName)
		label.text = labelText
		
		addSubviews(imageView, label, tapView)
		
		layer.cornerRadius = 20
		layer.masksToBounds = true
		
		layer.borderColor = UIColor.tintColor.cgColor
		layer.borderWidth = 3
		
		backgroundColor = .systemBackground
	}
	
	func setupConstraints(height: Double) {
		
		imageView.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			bottom: bottomAnchor,
			trailing: nil,
			size: .init(width: height, height: height)
		)
		
		label.anchor(
			top: topAnchor,
			leading: imageView.trailingAnchor,
			bottom: bottomAnchor,
			trailing: trailingAnchor
		)
		
		tapView.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			bottom: bottomAnchor,
			trailing: trailingAnchor
		)
	}
	
	@objc func click() {
		navigateTo()
	}
}
