//
//  FormScreenPresenter.swift
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

protocol FormScreenPresentationLogic {
  func presentForms(response: FormScreen.Data.Response)
}

class FormScreenPresenter: FormScreenPresentationLogic {
  weak var viewController: FormScreenDisplayLogic?
  
  // MARK: Do something
  
  func presentForms(response: FormScreen.Data.Response) {
    
    
    if response.isError {
        viewController?.displayMessageError()
    } else {
        
        var viewModel = [FormScreen.Data.ViewModel]()
        
        for i in (response.data?.cells)! {
            
            let data = FormScreen.Data.ViewModel.init(id: i.id ?? -1, type: i.type ?? nil, message: i.message ?? "", typefield: i.typefield ?? nil, hidden: i.hidden ?? false, topSpacing: i.topSpacing ?? 0.0, show: i.show ?? "", required: i.required ?? false)
            
            viewModel.append(data)
        }
        
        if viewModel.count > 0 {
            viewController?.displayForms(viewModel: viewModel)
        }
    }
  }
}
