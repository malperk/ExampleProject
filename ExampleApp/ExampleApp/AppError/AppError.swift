//
//  AppError.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation

struct AppError {
    let innerError: Error?
    let message: String?
}


extension AppError {
    var alertController: AlertController? {
        guard let alertText = message else { return nil }
        return AlertController(
            title: "Error",
            message: alertText,
            preferredStyle: .alert
        )
    }
}
