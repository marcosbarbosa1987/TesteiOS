//
//  Screen.swift
//
//  Created by Marcos Barbosa on 09/04/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Screen: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let downInfo = "downInfo"
    static let definition = "definition"
    static let risk = "risk"
    static let fundName = "fundName"
    static let info = "info"
    static let infoTitle = "infoTitle"
    static let title = "title"
    static let riskTitle = "riskTitle"
    static let whatIs = "whatIs"
    static let moreInfo = "moreInfo"
  }

  // MARK: Properties
  public var downInfo: [DownInfo]?
  public var definition: String?
  public var risk: Int?
  public var fundName: String?
  public var info: [Info]?
  public var infoTitle: String?
  public var title: String?
  public var riskTitle: String?
  public var whatIs: String?
  public var moreInfo: MoreInfo?

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
    if let items = json[SerializationKeys.downInfo].array { downInfo = items.map { DownInfo(json: $0) } }
    definition = json[SerializationKeys.definition].string
    risk = json[SerializationKeys.risk].int
    fundName = json[SerializationKeys.fundName].string
    if let items = json[SerializationKeys.info].array { info = items.map { Info(json: $0) } }
    infoTitle = json[SerializationKeys.infoTitle].string
    title = json[SerializationKeys.title].string
    riskTitle = json[SerializationKeys.riskTitle].string
    whatIs = json[SerializationKeys.whatIs].string
    moreInfo = MoreInfo(json: json[SerializationKeys.moreInfo])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = downInfo { dictionary[SerializationKeys.downInfo] = value.map { $0.dictionaryRepresentation() } }
    if let value = definition { dictionary[SerializationKeys.definition] = value }
    if let value = risk { dictionary[SerializationKeys.risk] = value }
    if let value = fundName { dictionary[SerializationKeys.fundName] = value }
    if let value = info { dictionary[SerializationKeys.info] = value.map { $0.dictionaryRepresentation() } }
    if let value = infoTitle { dictionary[SerializationKeys.infoTitle] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = riskTitle { dictionary[SerializationKeys.riskTitle] = value }
    if let value = whatIs { dictionary[SerializationKeys.whatIs] = value }
    if let value = moreInfo { dictionary[SerializationKeys.moreInfo] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.downInfo = aDecoder.decodeObject(forKey: SerializationKeys.downInfo) as? [DownInfo]
    self.definition = aDecoder.decodeObject(forKey: SerializationKeys.definition) as? String
    self.risk = aDecoder.decodeObject(forKey: SerializationKeys.risk) as? Int
    self.fundName = aDecoder.decodeObject(forKey: SerializationKeys.fundName) as? String
    self.info = aDecoder.decodeObject(forKey: SerializationKeys.info) as? [Info]
    self.infoTitle = aDecoder.decodeObject(forKey: SerializationKeys.infoTitle) as? String
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.riskTitle = aDecoder.decodeObject(forKey: SerializationKeys.riskTitle) as? String
    self.whatIs = aDecoder.decodeObject(forKey: SerializationKeys.whatIs) as? String
    self.moreInfo = aDecoder.decodeObject(forKey: SerializationKeys.moreInfo) as? MoreInfo
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(downInfo, forKey: SerializationKeys.downInfo)
    aCoder.encode(definition, forKey: SerializationKeys.definition)
    aCoder.encode(risk, forKey: SerializationKeys.risk)
    aCoder.encode(fundName, forKey: SerializationKeys.fundName)
    aCoder.encode(info, forKey: SerializationKeys.info)
    aCoder.encode(infoTitle, forKey: SerializationKeys.infoTitle)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(riskTitle, forKey: SerializationKeys.riskTitle)
    aCoder.encode(whatIs, forKey: SerializationKeys.whatIs)
    aCoder.encode(moreInfo, forKey: SerializationKeys.moreInfo)
  }

}
