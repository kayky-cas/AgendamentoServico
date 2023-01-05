//
//  AdressInfoLabel.swift
//  AgendamentoServicos
//
//  Created by unicred on 05/01/23.
//

import UIKit

class AddressInfoLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	
	func setup(title: String, content: String) {
		let fontSize = 18.0

		let normalText = title
		let normalTextAttr = [
//			NSAttributedString.Key.foregroundColor: UIColor.gray,
			NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)
		]

		let normalTextAttrString = NSAttributedString(string: normalText, attributes: normalTextAttr)

		let signUpText = content
		let signUpTextAttr = [
			NSAttributedString.Key.foregroundColor: UIColor.tintColor,
			NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize),
		]

		let signUpTextAttrString = NSAttributedString(string: signUpText, attributes: signUpTextAttr)

		let attributedText = NSMutableAttributedString()
		attributedText.append(normalTextAttrString)
		attributedText.append(signUpTextAttrString)

		self.attributedText = attributedText
	}
}
