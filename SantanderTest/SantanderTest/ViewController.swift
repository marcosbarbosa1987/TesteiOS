//
//  ViewController.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 05/04/19.
//  Copyright © 2019 Marcos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var formsView: FormScreenViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "FormScreenViewController") as! FormScreenViewController
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var financeView: FinanceScreenViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "FinanceScreenViewController") as! FinanceScreenViewController
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    @IBOutlet weak var containverView: UIView!
    @IBOutlet weak var stackButtons: UIStackView!
    @IBOutlet weak var viewInvestimentSelected: UIView!
    @IBOutlet weak var viewContactSelected: UIView!
    @IBOutlet weak var investimentButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var sharedButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        containverView.willMove(toSuperview: financeView.view)
        self.title = "Financiamento"
        
//        view.bringSubviewToFront(stackButtons)
    }
    
    
    @IBAction func goFinanceButtonClicked(_ sender: Any) {
        remove(asChildViewController: formsView)
        add(asChildViewController: financeView)
        
        self.viewInvestimentSelected.backgroundColor = #colorLiteral(red: 0.7141371369, green: 0.003021627432, blue: 0.005088226404, alpha: 1)
        self.viewContactSelected.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.investimentButton.backgroundColor = #colorLiteral(red: 0.7141371369, green: 0.003021627432, blue: 0.005088226404, alpha: 1)
        self.contactButton.backgroundColor = #colorLiteral(red: 0.7934240699, green: 0.000520688598, blue: 0, alpha: 1)
        self.title = "Financiamento"
    }
    
    @IBAction func goFormsButtonClicked(_ sender: Any) {
        remove(asChildViewController: financeView)
        add(asChildViewController: formsView)
        
        self.viewContactSelected.backgroundColor = #colorLiteral(red: 0.7141371369, green: 0.003021627432, blue: 0.005088226404, alpha: 1)
        self.viewInvestimentSelected.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.contactButton.backgroundColor = #colorLiteral(red: 0.7141371369, green: 0.003021627432, blue: 0.005088226404, alpha: 1)
        self.investimentButton.backgroundColor = #colorLiteral(red: 0.7934240699, green: 0.000520688598, blue: 0, alpha: 1)
        
        self.title = "Contato"
        
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        
        containverView.addSubview(viewController.view)
        
        viewController.view.frame = containverView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParent: self)
    }
    //
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        
        viewController.view.removeFromSuperview()
        
        viewController.removeFromParent()
    }
}

