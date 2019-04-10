//
//  Months.swift
//
//  Created by Marcos Barbosa on 09/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Months: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cDI = "CDI"
    static let fund = "fund"
  }

  // MARK: Properties
  public var cDI: Float?
  public var fund: Float?

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
    cDI = json[SerializationKeys.cDI].float
    fund = json[SerializationKeys.fund].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = cDI { dictionary[SerializationKeys.cDI] = value }
    if let value = fund { dictionary[SerializationKeys.fund] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.cDI = aDecoder.decodeObject(forKey: SerializationKeys.cDI) as? Float
    self.fund = aDecoder.decodeObject(forKey: SerializationKeys.fund) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(cDI, forKey: SerializationKeys.cDI)
    aCoder.encode(fund, forKey: SerializationKeys.fund)
  }

}
