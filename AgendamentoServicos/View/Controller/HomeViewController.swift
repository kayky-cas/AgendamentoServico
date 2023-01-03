//
//  HomeViewController.swift
//  AgendamentoServicos
//
//  Created by unicred on 02/01/23.
//

import UIKit

class HomeViewController: BaseViewController {
	
	let homeView = HomeView()

	override func loadView() {
		super.loadView()
		view = homeView
	}
	
	override func viewDidAppear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		homeView.setup()
		homeView.navigateTo = navigateToService
		homeView.logout = logout
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		homeView.setupConstraints()
	}
	
	func navigateToService(_ i: ServiceMode) {
		let servicesViewController = ServicesViewController()
		
		servicesViewController.mode = i
		
		self.definesPresentationContext = true
		
		navigationController?.pushViewController(servicesViewController, animated: true)
	}
	
	func logout() {
		navigationController?.popToRootViewController(animated: true)
	}
}
