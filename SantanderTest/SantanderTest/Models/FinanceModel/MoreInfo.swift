//
//  MoreInfo.swift
//
//  Created by Marcos Barbosa on 09/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class MoreInfo: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let year = "year"
    static let months = "12months"
    static let month = "month"
  }

  // MARK: Properties
  public var year: Year?
  public var months: Months?
  public var month: Month?

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
    year = Year(json: json[SerializationKeys.year])
    months = Months(json: json[SerializationKeys.months])
    month = Month(json: json[SerializationKeys.month])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = year { dictionary[SerializationKeys.year] = value.dictionaryRepresentation() }
    if let value = months { dictionary[SerializationKeys.months] = value.dictionaryRepresentation() }
    if let value = month { dictionary[SerializationKeys.month] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.year = aDecoder.decodeObject(forKey: SerializationKeys.year) as? Year
    self.months = aDecoder.decodeObject(forKey: SerializationKeys.months) as? Months
    self.month = aDecoder.decodeObject(forKey: SerializationKeys.month) as? Month
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(year, forKey: SerializationKeys.year)
    aCoder.encode(months, forKey: SerializationKeys.months)
    aCoder.encode(month, forKey: SerializationKeys.month)
  }

}
