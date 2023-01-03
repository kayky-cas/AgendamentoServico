//
//  ServiceViewModel.swift
//  AgendamentoServicos
//
//  Created by unicred on 03/01/23.
//

import Foundation

class ServiceViewModel {
	let db = ServiceRepositoryMock.shared
	
	func getServices() -> [Service] {
		var services: [Service] = []
		
		db.get { servicesDb in
			services = servicesDb
		}
		
		return services
	}
	
	func addService(_ service: Service) {
		db.add(service)
	}
}
