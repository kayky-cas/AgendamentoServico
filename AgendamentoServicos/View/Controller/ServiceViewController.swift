//
//  ServiceViewController.swift
//  AgendamentoServicos
//
//  Created by unicred on 02/01/23.
//

import UIKit

class ServiceViewController: BaseViewController {
	var updateCollectionView: () -> Void = {}
	
	var mode: ServiceMode = .easy
	
	let serviceViewModel = ServiceViewModel()
	let serviceView = ServiceView()
	
	override func loadView() {
		super.loadView()
		
		view = serviceView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.isNavigationBarHidden = false
		
		serviceView.setup(mode: mode)
		
		serviceView.sendService = { [self] service in
			serviceViewModel.addService(service)
			updateCollectionView()
			dismiss(animated: true)
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		serviceView.setupConstraints()
	}
}
