//
//  Cells.swift
//
//  Created by Marcos Barbosa on 08/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Cells: NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let hidden = "hidden"
        static let id = "id"
        static let topSpacing = "topSpacing"
        static let required = "required"
        static let message = "message"
        static let show = "show"
        static let type = "type"
        static let typefield = "typefield"
    }
    
    // MARK: Properties
    public var hidden: Bool? = false
    public var id: Int?
    public var topSpacing: Double?
    public var required: Bool? = false
    public var message: String?
    public var show: String?
    public var type: Int?
    public var typefield: Any?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        hidden = json[SerializationKeys.hidden].boolValue
        id = json[SerializationKeys.id].int
        topSpacing = json[SerializationKeys.topSpacing].doubleValue
        required = json[SerializationKeys.required].boolValue
        message = json[SerializationKeys.message].string
        show = json[SerializationKeys.show].string
        type = json[SerializationKeys.type].int
        typefield = json[SerializationKeys.typefield].object
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary[SerializationKeys.hidden] = hidden
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = topSpacing { dictionary[SerializationKeys.topSpacing] = value }
        dictionary[SerializationKeys.required] = required
        if let value = message { dictionary[SerializationKeys.message] = value }
        if let value = show { dictionary[SerializationKeys.show] = value }
        if let value = type { dictionary[SerializationKeys.type] = value }
        if let value = typefield { dictionary[SerializationKeys.typefield] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.hidden = aDecoder.decodeBool(forKey: SerializationKeys.hidden)
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.topSpacing = aDecoder.decodeObject(forKey: SerializationKeys.topSpacing) as? Double
        self.required = aDecoder.decodeBool(forKey: SerializationKeys.required)
        self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
        self.show = aDecoder.decodeObject(forKey: SerializationKeys.show) as? String
        self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? Int
        self.typefield = aDecoder.decodeObject(forKey: SerializationKeys.typefield) as Any
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(hidden, forKey: SerializationKeys.hidden)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(topSpacing, forKey: SerializationKeys.topSpacing)
        aCoder.encode(required, forKey: SerializationKeys.required)
        aCoder.encode(message, forKey: SerializationKeys.message)
        aCoder.encode(show, forKey: SerializationKeys.show)
        aCoder.encode(type, forKey: SerializationKeys.type)
        aCoder.encode(typefield, forKey: SerializationKeys.typefield)
    }
    
}
