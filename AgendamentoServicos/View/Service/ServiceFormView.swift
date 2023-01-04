//
//  ServiceFormView.swift
//  AgendamentoServicos
//
//  Created by unicred on 03/01/23.
//

import UIKit

class ServiceFormView: UIView {
	var mode: ServiceMode = .easy
	
	lazy var modeMenuButton: UIButton = {
		let uiButton = UIButton(configuration: .bordered())
		
		uiButton.setTitleColor(.tintColor, for: .normal)
		
		return uiButton
	}()
	
	lazy var datePickerLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Appointment date:"
		uiLabel.textColor = .gray
		
		return uiLabel
	}()
	
	lazy var typeLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "Service type:"
		uiLabel.textColor = .gray
		
		return uiLabel
	}()
	
	lazy var datePicker: UIDatePicker = {
		let uiDatePicker = UIDatePicker()
		
		uiDatePicker.datePickerMode = .dateAndTime
		
		return uiDatePicker
	}()
	
	func setup(mode: ServiceMode) {
		addSubviews(typeLabel, modeMenuButton, datePickerLabel, datePicker)
		
		self.mode = mode
		
		modeMenuButton.menu = UIMenu(title: "Mode", children: [
			UIAction(title: "Easy", image: UIImage(named: "easy"), handler: { action in
				self.mode = .easy
			}),
			UIAction(title: "Medium", image: UIImage(named: "medium"), handler: { action in
				self.mode = .medium
			}),
			UIAction(title: "Hard", image: UIImage(named: "hard"), handler: { action in
				self.mode = .hard
			})
		].sorted(by: { action, _ in
			mode == ServiceMode.fromName(action.title)
		}))
		
		modeMenuButton.showsMenuAsPrimaryAction = true
		modeMenuButton.changesSelectionAsPrimaryAction = true
	}
	
	func setupConstraints() {
		let inputSize = 186.5
		
		datePickerLabel.anchor(
			top: topAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 20, left: 0, bottom: 0, right: 0)
		)
		
		datePicker.anchor(
			top: datePickerLabel.bottomAnchor,
//			leading: leadingAnchor,
			padding: .init(top: 5, left: 10, bottom: 0, right: 0),
			size: .init(width: inputSize, height: 0)
		)
		
		datePicker.anchorCenterX(to: centerXAnchor)
		
		typeLabel.anchor(
			top: datePicker.bottomAnchor,
			leading: leadingAnchor,
			trailing: trailingAnchor,
			padding: .init(top: 20, left: 0, bottom: 0, right: 0)
		)
		
		modeMenuButton.anchor(
			top: typeLabel.bottomAnchor,
//			leading: leadingAnchor,
			padding: .init(top: 5, left: 10, bottom: 0, right: 0),
			size: .init(width: inputSize, height: 0)
		)
		
		modeMenuButton.anchorCenterX(to: centerXAnchor)
	}

	func setDefaultMode(_ type: ServiceMode) {
		self.mode = type
		modeMenuButton.menu?.replacingChildren([
			UIAction(title: "Easy", image: UIImage(named: "easy"), handler: { action in
				self.mode = .easy
			}),
			UIAction(title: "Medium", image: UIImage(named: "medium"), handler: { action in
				self.mode = .medium
			}),
			UIAction(title: "Hard", image: UIImage(named: "hard"), handler: { action in
				self.mode = .hard
			})
		].sorted(by: { action, _ in
			return ServiceMode.fromName(action.title) == type
		}))
	}
}
