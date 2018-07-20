//
//  FormPresenter.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit

protocol FormPresenterInput {
    func presentFetchResults(response: FormModels.Fetch.Response)
}

protocol FormPresenterOutput {
    func successFetchedItems(viewModel: FormModels.Fetch.ViewModel)
    func errorFetchingItems(viewModel: FormModels.Fetch.ViewModel)
}

class FormPresenter: FormPresenterInput{
    
    var output: FormPresenterOutput!
    
    func presentFetchResults(response: FormModels.Fetch.Response) {
        
        let viewModel = FormModels.Fetch.ViewModel(isError: response.isError ,message: response.message, cells: response.cells)
        
        if viewModel.isError{
            if let output = self.output{
                output.errorFetchingItems(viewModel: viewModel)
            }
        }else{
            if let output = self.output{
                output.successFetchedItems(viewModel: viewModel)
            }
        }
        
    }
    
}
