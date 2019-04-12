//
//  FinanceScreenRouter.swift
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

@objc protocol FinanceScreenRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol FinanceScreenDataPassing {
    var dataStore: FinanceScreenDataStore? { get }
}

class FinanceScreenRouter: NSObject, FinanceScreenRoutingLogic, FinanceScreenDataPassing {
    weak var viewController: FinanceScreenViewController?
    var dataStore: FinanceScreenDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: FinanceScreenViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: FinanceScreenDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}