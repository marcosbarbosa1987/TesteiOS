//
//  FinanceScreenWorker.swift
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
import SwiftyJSON

class FinanceScreenWorker {
    func getFinances(request: FinanceScreen.Data.Request, completion:@escaping(FinanceScreen.Data.Response) -> Void) {
        
        APIManager.get(request.url) { (response, error) in
            
            if let data = response as? Data {
                
                if error == nil {
                    let json: JSON = JSON(data)
                    let result: FinanceModel = FinanceModel(json: json)
                    
                    completion(FinanceScreen.Data.Response.init(isError: false, data: result))
                    
                } else {
                    completion(FinanceScreen.Data.Response.init(isError: true, data: nil))
                }
                
            } else {
                completion(FinanceScreen.Data.Response.init(isError: true, data: nil))
            }
        }
    }
}
