//
//  ViewController+StoreLocator.swift
//  C4GenericFilter
//
//  Created by rboyer on 06/07/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import C4GenericFilter

enum StoreLocatorTID: Int {
  case carrefour = 2263
  case city = 86
  case contact = 237
  case drive = 2215
  case express = 134
  case carrefourMarket = 13
  case montagne = 1689
  case proxy = 2272
  case contactMarche = 3347
  case market = 2266
  case bio = 3764
  case unknown = 0
}

/* protocol in filterPOD */
protocol FilterSelectableEntry {
  associatedtype U
  
  func value() -> String
  static func title() -> String
  static func idFilter() -> String
  var wsOutput : String { get }
  static var allValueE : [U] { get }
  
  static func convertTypeToFilterItem(entry: U.Type) -> [FilterSelectionableItem]
}

/* ------ */



/* in StoreLocatorPOD */
enum budgetType {
  case light
  case medium
  case heavy
  
  static let allValues = [light, medium, heavy]

  func wsValue() -> String {
    switch self {
    case .light:
      return "1"
    case .medium:
      return "2"
    case .heavy:
      return "3"
    }
  }
}
/* ------ */


/* in app */
extension budgetType : FilterSelectableEntry {
  
  typealias U = budgetType
  
  func value() -> String {
    switch self {
    case .light:
      return "€"
    case .medium:
      return "€€"
    case .heavy:
      return "€€€"
    }
  }
  
  static func title() -> String {
    return "Prix :"
  }
  
  static func idFilter() -> String {
    return "budget"
  }
  
  
  var wsOutput: String {
    return self.wsValue()
  }

  static var allValueE: [budgetType] {
    return self.allValues
  }
  
  var imagesE: UIImage? {
    return nil
  }
  
  var valueE: String {
    return self.value()
  }
  
  static var idFilterE: String {
    return self.idFilter()
  }
  
  
  static func convertTypeToFilterItem(entry: budgetType.Type) -> [FilterSelectionableItem] {
    return entry.allValueE.map {caseItem in
      StaticSelectionableItem.init(text:caseItem.valueE , output: caseItem.wsOutput, idFilter: U.idFilterE, selected: false)}
  }
}
/* ----- */



