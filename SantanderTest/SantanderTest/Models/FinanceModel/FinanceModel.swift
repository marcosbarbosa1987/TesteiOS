//
//  FinanceModel.swift
//
//  Created by Marcos Barbosa on 09/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FinanceModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let screen = "screen"
  }

  // MARK: Properties
  public var screen: Screen?

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
    screen = Screen(json: json[SerializationKeys.screen])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = screen { dictionary[SerializationKeys.screen] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.screen = aDecoder.decodeObject(forKey: SerializationKeys.screen) as? Screen
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(screen, forKey: SerializationKeys.screen)
  }

}
