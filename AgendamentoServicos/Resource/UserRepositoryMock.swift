//
// Created by Kayky Casagrande on 28/12/22.
//

import Foundation

class UserRepositoryMock {
    static let shared = UserRepositoryMock()

    var users: [User] = [
		.init(
			name: "Kayky Casagrande",
			birthDate: .init(),
			cpf: "000.000.000-00",
			rg: "",
			street: "",
			district: "",
			city: "",
			cep: "",
			state: "",
			country: "",
			phone: "",
			email: "kayky.casagrande@unicred.com.br",
			password: "12345"
		)
	]

    func getUsers(completion: @escaping ([User]) -> Void) {
        completion(users)
    }
	
	func addUser(user: User) {
		users.append(user)
	}
}
