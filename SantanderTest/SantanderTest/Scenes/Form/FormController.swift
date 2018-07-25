//
//  FormController.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

protocol FormControllerInput {
    
}

protocol FormControllerOutput {
    func fetchItems(request: FormModels.Fetch.Request)
}



class FormController: UIViewController {
    
    var viewScroll: UIScrollView!
    
    var label: UILabel!
    var textFieldName: SkyFloatingLabelTextField!
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
        
        awakeFromNib()
        output.fetchItems(request: FormModels.Fetch.Request(url: "https://floating-mountain-50292.herokuapp.com/cells.json"))
    }
    
    func successFetchedItems(viewModel: FormModels.Fetch.ViewModel) {
        print("sucesso = \(viewModel)")
        configureView(data: viewModel.cells!)
    }
    
    func errorFetchingItems(viewModel: FormModels.Fetch.ViewModel) {
        print("error = \(viewModel)")
    }

}

//customizeScreen
extension FormController{
    
    internal func configureView(data: [Cells]){
        
        if data.count > 0 {
            
            configureScroll()
            
        }
        
        for cell in data{
            
            switch Type(rawValue: cell.type) {
            case .field?://field
                
                switch cell.id{
                case 2://name
                    configureTextFieldName(cell: cell)
                case 4://email
                    configureTextFieldEmail(cell: cell)
                case 6://telefone
                    configureTextFieldPhone(cell: cell)
                default:
                    break
                }
                
            case .text?://text
                configureLabel(cell: cell)
            case .image?://image
                break
            case .checkbox?://checkbox
                break
            case .send?://send
                break
            default:
                break
            }
            
        }
        
    }
    
    internal func configureScroll(){
        
        viewScroll = UIScrollView()
        viewScroll.alwaysBounceHorizontal = false
        viewScroll.alwaysBounceVertical = true
        viewScroll.canCancelContentTouches = true
        viewScroll.isUserInteractionEnabled = true
        viewScroll.clipsToBounds = true
        viewScroll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewScroll)
        
        viewScroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        viewScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        viewScroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
    
    internal func configureLabel(cell: Cells){
        
        label = UILabel()
        label.text = "\(cell.message)"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        viewScroll.addSubview(label)
        
        label.topAnchor.constraint(equalTo: viewScroll.topAnchor, constant: CGFloat(cell.topSpacing)).isActive = true
        label.leadingAnchor.constraint(equalTo: viewScroll.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: viewScroll.trailingAnchor, constant: -16).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    internal func configureTextFieldName(cell: Cells){
        
        textFieldName = SkyFloatingLabelTextField()
        textFieldName.placeholder = "\(cell.message)"
        textFieldName.selectedLineColor = UIColor.black
        textFieldName.selectedTitleColor = UIColor.lightGray
        textFieldName.isUserInteractionEnabled = true
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        viewScroll.addSubview(textFieldName)
        
        textFieldName.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CGFloat(cell.topSpacing)).isActive = true
        textFieldName.leadingAnchor.constraint(equalTo: viewScroll.leadingAnchor, constant: 16).isActive = true
        textFieldName.trailingAnchor.constraint(equalTo: viewScroll.trailingAnchor, constant: -16).isActive = true
        textFieldName.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    internal func configureTextFieldEmail(cell: Cells){
        
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "\(cell.message)"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        viewScroll.addSubview(textFieldEmail)
        
        textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: CGFloat(cell.topSpacing)).isActive = true
        textFieldEmail.leadingAnchor.constraint(equalTo: viewScroll.leadingAnchor, constant: 16).isActive = true
        textFieldEmail.trailingAnchor.constraint(equalTo: viewScroll.trailingAnchor, constant: -16).isActive = true
        textFieldEmail.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    internal func configureTextFieldPhone(cell: Cells){
        
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "\(cell.message)"
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        viewScroll.addSubview(textFieldPhone)
        
        textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: CGFloat(cell.topSpacing)).isActive = true
        textFieldPhone.leadingAnchor.constraint(equalTo: viewScroll.leadingAnchor, constant: 16).isActive = true
        textFieldPhone.trailingAnchor.constraint(equalTo: viewScroll.trailingAnchor, constant: -16).isActive = true
        textFieldPhone.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
}


