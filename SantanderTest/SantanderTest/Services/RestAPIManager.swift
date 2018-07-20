//
//  RestAPIManager.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation
import Alamofire

class RestAPIManager{
   
    func getAllCells(from url: String, completionHandler: @escaping (Bool, [Cells]) -> Void){
        
        Alamofire.request(url).responseJSON { (response) in
            
            var cellsReturn = [Cells]()
            
            if let data = response.result.value {
                
                if let result = data as? Dictionary<String, Any>{
                    
                    if let cells = result["cells"] as? NSArray{
                        
                        for cell in cells{
                            let newCell = Cells()
                            
                            if let unitCell = cell as? Dictionary<String, Any>{
                                
                                if let id = (unitCell["id"] as AnyObject).integerValue{
                                    newCell.id = id
                                }
                                
                                if let type = (unitCell["type"] as AnyObject).integerValue{
                                    newCell.type = type
                                }
                                
                                if let hidden = (unitCell["hidden"] as AnyObject).boolValue{
                                    newCell.hidden = hidden
                                }
                                
                                if let message = (unitCell["message"] as? String){
                                    newCell.message = message
                                }
                                
                                if let required = (unitCell["required"] as AnyObject).boolValue{
                                    newCell.required = required
                                }
                                
                                if let show = (unitCell["show"] as AnyObject).integerValue{
                                    newCell.show = show
                                }
                                
                                if let typeField = (unitCell["typefield"] as? String){
                                    newCell.typeField = typeField
                                }
                                
                                if let topSpacing = (unitCell["topSpacing"] as AnyObject).floatValue{
                                    newCell.topSpacing = topSpacing
                                }
                                
                                cellsReturn.append(newCell)
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            
            completionHandler(true, cellsReturn)
            
        }
        
    }
  
}
