//
//  FormScreenInteractor.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 08/04/19.
//  Copyright (c) 2019 Marcos Barbosa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FormScreenBusinessLogic {
    func getFormsDetails(request: FormScreen.Data.Request)
}

protocol FormScreenDataStore {
    //var name: String { get set }
}

class FormScreenInteractor: FormScreenBusinessLogic, FormScreenDataStore {
    var presenter: FormScreenPresentationLogic?
    var worker: FormScreenWorker?
    //var name: String = ""
    
    
    func getFormsDetails(request: FormScreen.Data.Request) {
        worker = FormScreenWorker()
        
        
        worker?.getFormsFromAPI(request: request, completion: { (result) in
            self.presenter?.presentForms(response: result)
        })
    }
}
