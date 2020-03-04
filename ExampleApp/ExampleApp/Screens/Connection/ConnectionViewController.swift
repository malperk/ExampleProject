//
//  IPSaveViewController.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import UIKit

final class ConnectionViewController: UIViewController {
    
    @IBOutlet private var ipTextField: UITextField!
    
    typealias Interactor = AnonymousServerConnecting & ViewStateProviding
    
    let interactor: Interactor
    let ipValidator: StringValidating
    
    
    init(interactor: Interactor, ipValidator: StringValidating) {
        self.interactor = interactor
        self.ipValidator = ipValidator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservation()
    }
    
    private func setupObservation() {
        interactor.onViewStateChange = { [weak self] in
            self?.handleStateChange($0)
        }
    }
    
    private func handleStateChange(_ state: ViewState) {
        switch state {
        case .loading:
            // TODO: add a loading indicator.
            view.isUserInteractionEnabled = false
        case .ready:
            view.isUserInteractionEnabled = true
        case .empty:
            break
        case .error(let error):
            guard let alertController = error.alertController else { break }
            alertController.presentInNewWindow()
        }
    }
    
    private func showIPValidationAlert() {
        guard let alertController = AppError(
            innerError: nil,
            message: "Please control your IP value"
        ).alertController else {
            return
        }
        alertController.presentInNewWindow()
    }
    
    @IBAction private func connectClick(_ sender: Any) {
        guard let ip = ipTextField.text, ipValidator.validate(string: ip) else {
            showIPValidationAlert()
            return
        }
        interactor.connect(ipAddress: ip)
    }
    
}
