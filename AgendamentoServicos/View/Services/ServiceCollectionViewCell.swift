//
//  ServiceCollectionViewCell.swift
//  AgendamentoServicos
//
//  Created by unicred on 03/01/23.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
	static let identifier = "ServiceCollectionViewCell"
	
	private var service: Service? {
		didSet {
			switch service?.mode {
				case .easy:
					modeLabel.text = "Easy:"
					break
				case .medium:
					modeLabel.text = "Medium:"
					break
				case .hard:
					modeLabel.text = "Hard:"
				case .none:
					break
			}
			
			let formatter = DateFormatter()
			formatter.dateFormat = "dd/MM/yyyy - HH:mm"
			let dateString = formatter.string(from: service!.start)
			
			dateLabel.text = dateString
		}
	}
	
	lazy var dateLabel: UILabel = {
		let uiLabel = UILabel()
		
		
		return uiLabel
	}()
	
	lazy var modeLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textColor = .tintColor
		uiLabel.font = .italicSystemFont(ofSize: 20)
		
		return uiLabel
	}()
	
	override init(frame: CGRect) {
	super.init(frame: frame)
	setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setupCell()
		setupConstraints()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	func setup() {
		contentView.addSubviews(dateLabel, modeLabel)
	}
	
	func setupCell() {
		contentView.backgroundColor = .systemBackground
		contentView.layer.cornerRadius = 10
		contentView.layer.masksToBounds = true
		contentView.layer.borderWidth = 2.5
		contentView.layer.borderColor = UIColor.tintColor.cgColor
	}
	
	func setupConstraints() {
		modeLabel.anchor(
			leading: leadingAnchor,
			padding: .init(top: 0, left: 10, bottom: 0, right: 0)
		)
		
		modeLabel.anchorCenterY(to: centerYAnchor)
		
		dateLabel.anchor(
			trailing: trailingAnchor,
			padding: .init(top: 0, left: 0, bottom: 0, right: 10)
		)
		
		dateLabel.anchorCenterY(to: centerYAnchor)
	}
	
	func setService(_ service: Service) {
		self.service = service
	}
}
