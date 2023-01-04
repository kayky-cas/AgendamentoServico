//
//  ServicesViewController.swift
//  AgendamentoServicos
//
//  Created by unicred on 03/01/23.
//

import UIKit

class ServicesViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	var mode: ServiceMode = .easy
	let serviceViewModel = ServiceViewModel()
	
	lazy var registerButton: UIButton = {
		let uiButton = UIButton(configuration: .filled())
		
		uiButton.setTitle("Register service", for: .normal)
		uiButton.addTarget(self, action: #selector(presentRegiseter), for: .touchUpInside)
		
		return uiButton
	}()
	
	private let collectionView = UICollectionView(
		frame: .zero,
		collectionViewLayout: UICollectionViewFlowLayout()
	)
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.isNavigationBarHidden = false
		
		presentRegiseter()
		
		collectionView.register(
			ServiceCollectionViewCell.self,
			forCellWithReuseIdentifier: ServiceCollectionViewCell.identifier
		)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		setup()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		setupConstraints()
	}
		
	
	func setup() {
		view.addSubviews(registerButton, collectionView)
		collectionView.isPrefetchingEnabled = false
		collectionView.backgroundColor = view.backgroundColor
	}
		
	func setupConstraints() {
		registerButton.anchor(
			top: view.safeAreaLayoutGuide.topAnchor
		)
		
		registerButton.anchorCenterX(to: view.centerXAnchor)
		
		collectionView.anchor(
			top: registerButton.bottomAnchor,
			leading: view.leadingAnchor,
			bottom: view.bottomAnchor,
			trailing: view.trailingAnchor,
			padding: .init(top: 20, left: 0, bottom: 0, right: 0)
		)
	}
	
	@objc func presentRegiseter() {
		let serviceViewController = ServiceViewController()
		
		serviceViewController.mode = mode
		serviceViewController.updateCollectionView = {
			self.collectionView.reloadData()
		}
		
		serviceViewController.modalPresentationStyle = .pageSheet
//
//		let nav = UINavigationController(rootViewController: serviceViewController)
//		nav.modalPresentationStyle = .pageSheet

		if let sheet = serviceViewController.sheetPresentationController {
			sheet.detents = [.medium()]
		}
		
		present(serviceViewController, animated: true, completion: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return serviceViewModel.getServices().filter({ service in
			service.userEmail == UserViewModel.shared.getUser()?.email
		}).count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: ServiceCollectionViewCell.identifier,
			for: indexPath
		) as! ServiceCollectionViewCell
		
		let service = serviceViewModel.getServices().filter({ service in
			service.userEmail == UserViewModel.shared.getUser()?.email
		})[indexPath.item]
		
		cell.setService(service)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = view.frame.width - 50
		return CGSize(width: width, height: 50)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 1, left: 5, bottom: 1, right: 5)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		print("\(indexPath.item)")
	}
}
