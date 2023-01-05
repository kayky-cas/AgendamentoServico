//
//  Service.swift
//  AgendamentoServicos
//
//  Created by unicred on 03/01/23.
//

import Foundation

struct Service {
	let start: Date
	let mode: ServiceMode
	let address: Address
	let userEmail: String
	
	init(start: Date, mode: ServiceMode, address: Address, userEmail: String) {
		self.start = start
		self.mode = mode
		self.address = address
		self.userEmail = userEmail
	}
}

enum ServiceMode {
	case easy
	case medium
	case hard
	
	static func fromName(_ name: String) -> ServiceMode {
		switch name {
			case "Easy": return .easy
			case "Medium": return .medium
			default: return .hard
		}
	}
}
