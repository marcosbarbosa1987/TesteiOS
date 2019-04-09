//
//  CustomSessionManager.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 08/04/19.
//  Copyright © 2019 Marcos Barbosa. All rights reserved.
//

import UIKit
import Alamofire

class CustomSessionManager: NSObject {
    
    static var sharedInstance: CustomSessionManager! = CustomSessionManager()
    
    let timeout: TimeInterval = 40.0
    
    var configuration: URLSessionConfiguration!
    var manager: SessionManager!
    
    fileprivate override init() {
        super.init()
        
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = 40
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        manager = Alamofire.SessionManager(configuration: configuration)
    }
}
