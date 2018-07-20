//
//  FormModels.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import UIKit

struct FormModels {
    
    struct Fetch {
        
        struct Request {
            //MARK: used to make request
            var url: String
        }
        
        struct Response {
            //MARK: usert to get response
            
            var isError: Bool
            var message: String?
            var cells:   [Cells]?
            
        }
        
        struct ViewModel {
            //MARK: usert to stored everything to show in UI
            
            var isError: Bool
            var message: String?
            var cells: [Cells]?
            
        }
        
    }
    
}
