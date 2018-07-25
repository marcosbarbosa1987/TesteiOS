//
//  Constants.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 21/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit


func redNormal() -> UIColor{
    return UIColor(red: 215/255, green: 1/255, blue: 1/255, alpha: 1)
}

func redSelected() -> UIColor{
    return UIColor(red: 200/255, green: 4/255, blue: 4/255, alpha: 1)
}

enum Type: Int{
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int{
    
    case text = 1
    case tellNumber = 2
    case email = 3
}
