//
//  FormRouter.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit

protocol FormRouterInput {
    func showAnotherVC()
}


class FormRouter: FormRouterInput{
    
    weak var viewController: FormController!
    
    func showAnotherVC() {
        viewController.performSegue(withIdentifier: "someVC", sender: nil)
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "someVC"{
            //let investiment = segue.destination as! InvestimentController
            //investiment.teste =
        }else if segue.identifier == "investiment"{
            
            if let cells = sender as? [Cells]{
                let destination = segue.destination as! InvestimentController
                destination.teste = cells
                if cells.count > 0 {
                    destination.updateValue()
                }
            }
            
        }
        
    }
    
}
