//
//  ServiceDetailView.swift
//  AgendamentoServicos
//
//  Created by unicred on 05/01/23.
//

import UIKit

class ServiceDetailView: UIView {
	var service: Service? {
		didSet {
			if let service = service {
				switch service.mode {
					case .easy:
						typeLabel.text = "Easy"
						break
					case .medium:
						typeLabel.text = "Medium"
						break
					case .hard:
						typeLabel.text = "Hard"

				}
				
				let formatter = DateFormatter()
				formatter.dateFormat = "dd/MM/yyyy - HH:mm"
				let dateString = formatter.string(from: service.start)
				
				dateLabel.text = dateString
				
				let address = service.address

				[
					"Street": (streetLabel, address.street),
					"District": (districtLabel, address.district),
					"City": (cityLabel, address.city),
					"CEP": (cepLabel, address.cep),
					"State": (stateLabel, address.state),
					"Country": (countryLabel, address.country)
				].forEach { (title, val) in
					let (label, content) = val
					label.setup(title: title + ": ", content: content)
				}
			}
		}
	}
	
	lazy var typeLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.textColor = .tintColor
		uiLabel.text = "Easy"
		uiLabel.font = .boldSystemFont(ofSize: 40)
		
		return uiLabel
	}()
	
	lazy var dateLabel: UILabel = {
		let uiLabel = UILabel()
		
		uiLabel.text = "20/12/2022 - 10:45"
		uiLabel.font = .systemFont(ofSize: 20)
		
		return uiLabel
	}()
	
	lazy var streetLabel: AddressInfoLabel = {
		let uiLabel = AddressInfoLabel()

		uiLabel.setup(title: "Street: ", content: "Rua 8 de Julho")

		return uiLabel
	}()
	
	lazy var districtLabel: AddressInfoLabel = {
		let uiLabel = AddressInfoLabel()

		uiLabel.setup(title: "District: ", content: "Jardim Botânico")

		return uiLabel
	}()
	
	lazy var cityLabel: AddressInfoLabel = {
		let uiLabel = AddressInfoLabel()

		uiLabel.setup(title: "City: ", content: "Porto Alegre")

		return uiLabel
	}()
	
	lazy var cepLabel: AddressInfoLabel = {
		let uiLabel = AddressInfoLabel()

		uiLabel.setup(title: "CEP: ", content: "90690-240")

		return uiLabel
	}()
	
	lazy var stateLabel: AddressInfoLabel = {
		let uiLabel = AddressInfoLabel()

		uiLabel.setup(title: "State: ", content: "Rio Grande do Sul")

		return uiLabel
	}()
	
	lazy var countryLabel: AddressInfoLabel = {
		let uiLabel = AddressInfoLabel()

		uiLabel.setup(title: "Country: ", content: "Brasil")

		return uiLabel
	}()
	
	func setup() {
		addSubviews(
			typeLabel,
			dateLabel,
			streetLabel,
			districtLabel,
			cityLabel,
			cepLabel,
			stateLabel,
			countryLabel
		)
	}
	
	func setupConstraints() {
		typeLabel.anchor(
			top: safeAreaLayoutGuide.topAnchor,
			padding: .init(top: 30, left: 0, bottom: 0, right: 0)
		)
		
		dateLabel.anchor(
			top: typeLabel.bottomAnchor,
			padding: .init(top: 20, left: 0, bottom: 0, right: 0)
		)
		
		[typeLabel, dateLabel].forEach({ $0.anchorCenterX(to: centerXAnchor) })
		
		streetLabel.anchor(
			top: dateLabel.bottomAnchor,
			leading: dateLabel.leadingAnchor,
			padding: .init(top: 50, left: -15, bottom: 0, right: 0)
		)
		
		districtLabel.anchor(
			top: streetLabel.bottomAnchor,
			leading: streetLabel.leadingAnchor
		)
		
		cityLabel.anchor(
			top: districtLabel.bottomAnchor,
			leading: streetLabel.leadingAnchor
		)
		
		cepLabel.anchor(
			top: cityLabel.bottomAnchor,
			leading: streetLabel.leadingAnchor
		)
		
		stateLabel.anchor(
			top: cepLabel.bottomAnchor,
			leading: streetLabel.leadingAnchor
		)
		
		countryLabel.anchor(
			top: countryLabel.bottomAnchor,
			leading: streetLabel.leadingAnchor
		)

	}
}
