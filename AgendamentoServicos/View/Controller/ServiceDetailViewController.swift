//
//  ServiceDetailViewController.swift
//  AgendamentoServicos
//
//  Created by unicred on 05/01/23.
//

import UIKit

class ServiceDetailViewController: BaseViewController {
	var service: Service?
	
	let serviceDetailView = ServiceDetailView()
	
	override func loadView() {
		super.loadView()
		
		view = serviceDetailView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		serviceDetailView.setup()
		serviceDetailView.service = service
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		serviceDetailView.setupConstraints()
	}
}
