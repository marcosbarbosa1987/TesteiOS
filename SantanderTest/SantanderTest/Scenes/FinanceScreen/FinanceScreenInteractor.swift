//
//  FinanceScreenInteractor.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 09/04/19.
//  Copyright (c) 2019 Marcos Barbosa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FinanceScreenBusinessLogic {
    func requestFinances(request: FinanceScreen.Data.Request)
}

protocol FinanceScreenDataStore {
    //var name: String { get set }
}

class FinanceScreenInteractor: FinanceScreenBusinessLogic, FinanceScreenDataStore {
    var presenter: FinanceScreenPresentationLogic?
    var worker: FinanceScreenWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func requestFinances(request: FinanceScreen.Data.Request) {
        worker = FinanceScreenWorker()
        worker?.getFinances(request: request, completion: { (response) in
            self.presenter?.presentFinance(response: response)
        })
    }
}
