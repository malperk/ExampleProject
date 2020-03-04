//
//  ViewStateProviding.swift
//  ExampleApp
//
//  Created by Alper Karatas on 04/03/2020.
//  Copyright © 2020 Alper Karatas. All rights reserved.
//

import Foundation


/// Enum describing the available states of a view
enum ViewState {
    /// Initial state and state where no data is available
    case empty
    /// State when the data is being loaded
    case loading
    /// State when new data is available to the view
    case ready
    /// State when an error has occured and should be reflected in the view
    case error(AppError)
}


protocol ViewStateProviding: class {
    
    /// Current viewState
    var viewState: ViewState { get }
    
    /// Callback to observe view state changes..
    var onViewStateChange: ((ViewState) -> ())?  { get set }
    
}

