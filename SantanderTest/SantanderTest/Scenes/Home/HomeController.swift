//
//  HomeController.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 21/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import UIKit



class HomeController: UIViewController {
    
    
    
    var buttonInvestiment: UIButton!
    var buttonContact: UIButton!
    
    var heightConstraintButtonInvestiment: NSLayoutConstraint?
    var heightConstraintButtonContact: NSLayoutConstraint?
    
    var containerInvestiment: UIView!
    var containerContact: UIView!
    
    var isInvesting = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        configureContainerInvestiment()
        configureContainerContact()
        configureButtonContact()
        configureButtonInvesting()
        containerContact.isHidden = true
        
    }
    
    
    @objc func switchScreenTapped(_ sender: UIButton){
        
        let tag = sender.tag
        
        switch tag {
        case 1:
            
            if isInvesting == false{
                heightConstraintButtonInvestiment?.constant = 57
                heightConstraintButtonContact?.constant = 55
                buttonInvestiment.backgroundColor = redSelected()
                buttonContact.backgroundColor = redNormal()
                containerInvestiment.isHidden = false
                containerContact.isHidden = true
            }
            isInvesting = true
            
        case 2:
            
            if isInvesting{
                heightConstraintButtonInvestiment?.constant = 55
                heightConstraintButtonContact?.constant = 57
                buttonInvestiment.backgroundColor = redNormal()
                buttonContact.backgroundColor = redSelected()
                containerInvestiment.isHidden = true
                containerContact.isHidden = false
            }
            isInvesting = false
            
        default:
            break
        }
        
    }
    
    
}

//Configuring screen
extension HomeController{
    
    internal func configureContainerInvestiment(){
        
        containerInvestiment = UIView()
        containerInvestiment.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerInvestiment)
        
        containerInvestiment.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        containerInvestiment.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
        containerInvestiment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerInvestiment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        
        
        let controller = InvestimentController()
        addChildViewController(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        containerInvestiment.addSubview(controller.view)
        
        controller.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
        controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        controller.didMove(toParentViewController: self)
    }
    
    internal func configureContainerContact(){
        
        containerContact = UIView()
        containerContact.backgroundColor = UIColor.green
        containerContact.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerContact)
        
        containerContact.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        containerContact.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
        containerContact.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerContact.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
    }
    
    internal func configureButtonInvesting(){
        
        buttonInvestiment = UIButton()
        buttonInvestiment.backgroundColor = redSelected()
        buttonInvestiment.translatesAutoresizingMaskIntoConstraints = false
        buttonInvestiment.setTitle("Investimento", for: .normal)
        buttonInvestiment.tag = 1
        buttonInvestiment.addTarget(self, action: #selector(switchScreenTapped(_:)), for: .touchUpInside)
        view.addSubview(buttonInvestiment)
        
        buttonInvestiment.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        buttonInvestiment.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2).isActive = true
        buttonInvestiment.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        heightConstraintButtonInvestiment = buttonInvestiment.heightAnchor.constraint(equalToConstant: 57)
        heightConstraintButtonInvestiment?.isActive = true
    }
    
    internal func configureButtonContact(){
        
        buttonContact = UIButton()
        buttonContact.backgroundColor = redNormal()
        buttonContact.translatesAutoresizingMaskIntoConstraints = false
        buttonContact.setTitle("Contato", for: .normal)
        buttonContact.tag = 2
        buttonContact.addTarget(self, action: #selector(switchScreenTapped(_:)), for: .touchUpInside)
        view.addSubview(buttonContact)
        
        buttonContact.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        buttonContact.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2).isActive = true
        buttonContact.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        heightConstraintButtonContact = buttonContact.heightAnchor.constraint(equalToConstant: 55)
        heightConstraintButtonContact?.isActive = true
    }
    
}
