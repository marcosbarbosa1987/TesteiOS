//
//  APIManager.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 08/04/19.
//  Copyright © 2019 Marcos Barbosa. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
   
    static let managerController: CustomSessionManager = CustomSessionManager.sharedInstance
    
    static var basicHeaders = [
        "session-token": "",
        "accept-language": "pt-br",
        "cache-control": "no-cache",
        "authorization": "",
        "content-Type": "application/json",
        "accept": "application/json",
        "device-Type": "",
        "device-name": "",
        "device-version": "",
        "device-token":""
    ]
    
    static func get(_ url: String, _ parameters: Dictionary<String, Any>? = nil,  completion: @escaping(Any?, Any?) -> Void) {
        
        var headers = basicHeaders
        
        managerController.manager.request(url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).validate(statusCode: 200..<300).responseJSON { (response) in
            print("GET: \(response.request?.url?.absoluteString ?? "")")
            
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            print("Error: \(response.result.error)")
            
            
            switch response.result{
            case .success:
                completion(response.data, nil)
                break
                
            case .failure(let error):
                completion(response.data,error)
                break
            }
        }
    }
    
    static func post(_ url: String, parameters: Dictionary<String, Any>? = nil, completion: @escaping(Any?, Any?) -> Void) {
        
        let headers = basicHeaders
       
        managerController.manager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
           
            switch response.result {
            case .success:
                completion(response.data, nil)
                break
                
            case .failure(let error):
                completion(response.data, error)
                break
            }
        }
    }
    
    static func put(_ url: String, parameters: Dictionary<String, Any>? = nil, completion: @escaping(Any?, Any?) -> Void) {
        
        let headers = basicHeaders
       
        managerController.manager.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
          
            switch response.result {
            case .success:
                completion(response.data, nil)
                break
                
            case .failure(let error):
                completion(response.data, error)
                break
            }
        }
    }
    
    static func patch(_ url: String, parameters: Dictionary<String, Any>? = nil, completion: @escaping(Any?, Any?) -> Void) {
        
        let headers = basicHeaders
      
        managerController.manager.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
          
            switch response.result {
            case .success:
                completion(response.data, nil)
                break
                
            case .failure(let error):
                completion(response.data, error)
                break
            }
        }
    }
}
