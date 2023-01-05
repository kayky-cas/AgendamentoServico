//
// Created by Kayky Casagrande on 27/12/22.
//

import Foundation

struct User {
    let name: String
    let birthDate: Date
    let cpf: String
    let rg: String

	let address: Address

    let phone: String

    let email: String
    let password: String
}

struct Address {
	let street: String
	let district: String
	let city: String
	let cep: String
	let state: String
	let country: String
}
