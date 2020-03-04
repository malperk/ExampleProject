//
//  Validators.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation


struct IPValidator: StringValidating {
    private let pattern =  "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
    func validate(string: String) -> Bool {
        let predicate = NSPredicate(format:"SELF MATCHES %@", pattern)
        return predicate.evaluate(with: string)
    }
}


struct UsernameValidator: StringValidating {
    func validate(string: String) -> Bool {
        guard  string.count > 1 else { return false }
        return true
    }
}


struct PasswordValidator: StringValidating {
    func validate(string: String) -> Bool {
        guard  string.count > 4 else { return false }
        return true
    }
}
