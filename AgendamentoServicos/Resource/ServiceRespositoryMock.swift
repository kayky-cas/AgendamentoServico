//
//  ServiceRespositoryMock.swift
//  AgendamentoServicos
//
//  Created by unicred on 03/01/23.
//

import Foundation

class ServiceRepositoryMock {
	static let shared = ServiceRepositoryMock()

	var services: [Service] = [
		.init(
			start: .init(),
			mode: .easy,
			address: .init(
				street: "Rua 8 de Julho",
				district: "Jardim Botânico",
				city: "Porto Alegre",
				cep: "90690-240",
				state: "Rio Grande do Sul",
				country: "Brasil"
			),
			userEmail: "kayky.casagrande@unicred.com.br")
	]

	func get(completion: @escaping ([Service]) -> Void) {
		completion(services)
	}
	
	func add(_ service: Service) {
		services.append(service)
	}
}
