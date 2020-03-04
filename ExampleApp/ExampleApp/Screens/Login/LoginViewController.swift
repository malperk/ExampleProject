//
//  LoginViewController.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    typealias Interactor = ServerConnecting & ViewStateProviding
    
    let interactor: Interactor
    let usernameValidator: StringValidating
    let passwordValidator: StringValidating
    
    
    init(interactor: Interactor, usernameValidator: StringValidating, passwordValidator: StringValidating) {
        self.interactor = interactor
        self.usernameValidator = usernameValidator
        self.passwordValidator = passwordValidator
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
        case .ready, .loading, .empty:
            break
        case .error(let error):
            guard let alertController = error.alertController else { break }
            alertController.presentInNewWindow()
        }
    }
    
    @IBAction func cancelClick(_ sender: Any) {
        // ASK : What should client do when cancel button clicked.
    }
    
    @IBAction func loginClick(_ sender: Any) {
        guard let username = usernameTextField.text, usernameValidator.validate(string: username) else {
            showValidationAlert(message: "Please control your username value")
            return
        }
        guard let password = passwordTextField.text, passwordValidator.validate(string: password) else {
            showValidationAlert(message: "Please control your password value")
            return
        }
        interactor.connect(username: username, password: password)
    }
    
    private func showValidationAlert(message: String) {
        let alertController = AlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alertController.presentInNewWindow()
    }
}
