//
//  FormConfigurator.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit

extension FormController: FormPresenterOutput{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
    
}

extension FormInteractor: FormControllerOutput{
    
}

extension FormPresenter: FormInteractorOutput{
    
}

class FormConfigurator {
    
    static let sharedInstance = FormConfigurator()
    
    private init(){}
    
    func configure(viewController: FormController){
        
        let router = FormRouter()
        router.viewController = viewController
        
        let presenter = FormPresenter()
        presenter.output = viewController
        
        let interactor = FormInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
        
    }
}
