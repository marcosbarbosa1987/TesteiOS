//
//  FormController.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import UIKit

protocol FormControllerInput {
    
}

protocol FormControllerOutput {
    func fetchItems(request: FormModels.Fetch.Request)
}



class FormController: UIViewController {

    var labelContact: UILabel!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    
    var output: FormControllerOutput!
    var router: FormRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        FormConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       output.fetchItems(request: FormModels.Fetch.Request(url: "https://floating-mountain-50292.herokuapp.com/cells.json"))
    }

    func successFetchedItems(viewModel: FormModels.Fetch.ViewModel) {
        print("sucesso = \(viewModel)")
    }

    func errorFetchingItems(viewModel: FormModels.Fetch.ViewModel) {
        print("error = \(viewModel)")
    }

}

