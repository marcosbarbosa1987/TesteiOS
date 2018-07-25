//
//  InvestimentController.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 21/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import UIKit


class InvestimentController: UIViewController {

    var teste = [Cells]()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        configureScreen()
        
        if teste.count > 0 {
            updateValue()
        }
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureScreen(){
        
        label = UILabel()
        let text = "\(teste.first?.message)"
        label.text = text
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func updateValue(){
        DispatchQueue.main.async {
            self.label.text = "\(self.teste.first?.message)"
            self.view.setNeedsDisplay()
            self.label.setNeedsDisplay()
            self.label.text = "se fudeu "
            self.viewDidLoad()
            print("printando a bosta do valor = \(self.label.text)")
            self.label.reloadInputViews()
        }
    }
    
}
