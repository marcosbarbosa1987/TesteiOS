//
//  FormWorker.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit

typealias responseHandler = (_ response: FormModels.Fetch.Response) -> ()

class FormWorker {
    
    func fetchCells(url: String, success: @escaping(responseHandler), fail: @escaping(responseHandler)){
        
        let managerAPI = RestAPIManager()
        
        managerAPI.getAllCells(from: url) { (validate, data) in
            
            if validate{
                success(FormModels.Fetch.Response(isError: false, message: "Dados recuperado com sucesso", cells: data))
            }else{
                fail(FormModels.Fetch.Response(isError: true, message: "Não foi possivel encontrar nada", cells: nil))
            }
            
        }
        
    }
    
}

