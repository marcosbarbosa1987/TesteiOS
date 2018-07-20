//
//  FormInteractor.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit

protocol FormInteractorInput {
    func fetchItems(request: FormModels.Fetch.Request)
}

protocol FormInteractorOutput {
    func presentFetchResults(response: FormModels.Fetch.Response)
}

class FormInteractor: FormInteractorInput {
    
    
    var output: FormInteractorOutput!
    var worker: FormWorker!
    
    func fetchItems(request: FormModels.Fetch.Request) {
        
        worker = FormWorker()
        
        worker.fetchCells(url: request.url , success: { (data) in
            
            self.output.presentFetchResults(response: FormModels.Fetch.Response(isError: false, message: "Dados recuperados", cells: data.cells))
            
        }) { (date) in
            
            self.output.presentFetchResults(response: FormModels.Fetch.Response(isError: true, message: "Dados não recuperados", cells: nil))
            
        }
        
        
    }
    
}
