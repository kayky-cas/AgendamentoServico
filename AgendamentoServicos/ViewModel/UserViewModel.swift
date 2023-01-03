//
// Created by Kayky Casagrande on 28/12/22.
//

import Foundation

class UserViewModel {
	public static let shared = UserViewModel()
	
    private let db = UserRepositoryMock.shared
    private var user: User? = nil

    private func getUserByEmail(email: String) -> User? {
        var user: User? = nil

        db.getUsers { users in
            user = users.first {
                $0.email == email
            }
        }

        return user
    }

    func login(email: String, password: String) -> Bool {
        let user = getUserByEmail(email: email)

        if let user = user {
            if user.password == password {
                self.user = user
                return true
            }
        }

        return false
    }
	
	func addUser(user: User) {
		db.addUser(user: user)
	}

    func isLogged() -> Bool {
        user != nil
    }

    func getUser() -> User? {
        user
    }
	
	func logout() {
		user = nil
	}
}
