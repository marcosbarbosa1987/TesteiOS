//
//  Cells.swift
//  SantanderTest
//
//  Created by Marcos Barbosa on 20/07/2018.
//  Copyright © 2018 n/a. All rights reserved.
//

import Foundation

class Cells{
    
    private var _id:         Int
    private var _type:       Int
    private var _message:    String
    private var _hidden:     Bool
    private var _topSpacing: Float
    private var _show:       Int
    private var _required:   Bool
    private var _typeField:  String
  
    
    init() {
        _id = 0
        _type = 0
        _message = ""
        _hidden = false
        _topSpacing = 0.0
        _show = 0
        _required = true
        _typeField = ""
    }
    
//    _id
    var id: Int{
        get{
            return _id
        }
        set{
            _id = newValue
        }
    }
    
//    _type
    var type: Int{
        get{
            return _type
        }
        set{
            _type = newValue
        }
    }
    
//    _message
    var message: String{
        get{
            return _message
        }
        set{
            _message = newValue
        }
    }
    
//    _hidden
    var hidden: Bool{
        get{
            return _hidden
        }
        set{
            _hidden = newValue
        }
    }
    
//    _topSpacing
    var topSpacing: Float{
        get{
            return _topSpacing
        }
        set{
            _topSpacing = newValue
        }
    }
    
//    _show
    var show: Int{
        get{
            return _show
        }
        set{
            _show = newValue
        }
    }
    
//    _required
    var required: Bool{
        get{
            return _required
        }
        set{
            _required = newValue
        }
    }
    
//    _typeField
    var typeField: String{
        get{
            return _typeField
        }
        set{
            _typeField = newValue
        }
    }
}
