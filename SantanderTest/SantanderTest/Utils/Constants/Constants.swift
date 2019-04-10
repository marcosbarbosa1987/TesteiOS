//
//  Constants.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 08/04/19.
//  Copyright © 2019 Marcos Barbosa. All rights reserved.
//

import Foundation


enum URLS: String {
    case FormFields = "https://floating-mountain-50292.herokuapp.com/cells.json"
    case FinanceActive = "https://floating-mountain-50292.herokuapp.com/fund.json"
}

enum Segues: String {
    case financeSegue = "go_finance_controller"
    case formsSegue   = "go_forms_controller"
}
