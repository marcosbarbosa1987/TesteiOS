//
//  FormScreenWorker.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 08/04/19.
//  Copyright (c) 2019 Marcos Barbosa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import UIKit
import SwiftyJSON


class FormScreenWorker: NSObject {
    
    
    func getFormsFromAPI(request: FormScreen.Data.Request, completion:@escaping(FormScreen.Data.Response) -> Void) {
        
        APIManager.get(request.url, completion: { (response, error) in
            if let data = response as? Data {
                
                if error == nil {
                    let json: JSON = JSON(data)
                    let response: FormsModel = FormsModel(json: json)
                    
                    if (response.cells?.count)! > 0 {
                        
                        completion(FormScreen.Data.Response.init(isError: false, data: response))
                    } else {
                        completion(FormScreen.Data.Response.init(isError: true, data: nil))
                    }
                    
                } else {
                    completion(FormScreen.Data.Response.init(isError: true, data: nil))
                }
                
            } else {
                completion(FormScreen.Data.Response.init(isError: true, data: nil))
            }
        })
    }
}