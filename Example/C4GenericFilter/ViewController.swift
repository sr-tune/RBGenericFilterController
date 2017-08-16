//
//  ViewController.swift
//  C4GenericFilter
//
//  Created by sr-tune on 07/06/2017.
//  Copyright (c) 2017 sr-tune. All rights reserved.
//

import UIKit
import C4GenericFilter



class ViewController: UIViewController  {
  
  @IBOutlet weak var segmentedContextSelection: UISegmentedControl!
  
  var filterTableViewController: FilterGenericTableViewController?
  var filterVC : UINavigationController?
  
  /***** Store Locator ***/
  var storeCountValuesInitial  = [StaticSelectionableItem.init(text : "1", output : "1", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "2", output : "2", idFilter: "NBmagasin", selected: true),
                                  StaticSelectionableItem.init(text : "3", output : "3", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "4", output : "4", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "5", output : "5", idFilter: "NBmagasin", selected: true),
                                  StaticSelectionableItem.init(text : "6", output : "6", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "7", output : "7", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "8", output : "8", idFilter: "NBmagasin", selected: true),
                                  StaticSelectionableItem.init(text : "9", output : "9", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "10", output : "10", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "11", output : "11", idFilter: "NBmagasin", selected: true),
                                  StaticSelectionableItem.init(text : "12", output : "12", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "13", output : "13", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "14", output : "14", idFilter: "NBmagasin", selected: true),
                                  StaticSelectionableItem.init(text : "15", output : "15", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "16", output : "16", idFilter: "NBmagasin", selected: false),
                                  StaticSelectionableItem.init(text : "17", output : "17", idFilter: "NBmagasin", selected: true),
                                  StaticSelectionableItem.init(text : "18", output : "18", idFilter: "NBmagasin", selected: false)
  ]
  
  
  
  /***** RECETTE ***/
  var recetteBudgetValuesInitial  = [StaticSelectionableItem.init(text : "€", output : "1", idFilter: "budget", selected: false),
                                     StaticSelectionableItem.init(text : "€€", output : "2", idFilter: "budget", selected: true),
                                     StaticSelectionableItem.init(text : "€€€", output : "3", idFilter: "budget", selected: false)
  ]
  
  var recetteDifficultyValuesInitial  = [StaticSelectionableItem.init(text : "easy", output : "1", idFilter: "difficulty", selected: false),
                                         StaticSelectionableItem.init(text : "moyen", output : "2", idFilter: "fruits", selected: true),
                                         StaticSelectionableItem.init(text : "difficile", output : "3", idFilter: "fruits", selected: false)
  ]
  
  var recetteTimeValuesInitial  = [StaticSelectionableItem.init(text : "⏱", output : "1", idFilter: "timer", selected: false),
                                   StaticSelectionableItem.init(text : "⏱⏱", output : "2", idFilter: "timer", selected: true),
                                   StaticSelectionableItem.init(text : "⏱⏱⏱", output : "3", idFilter: "timer", selected: false)
  ]
  
  /*****  ECOUPONS  **/
  var ecouponsFormatValuesInitial  = [StaticSelectionableItem.init(text : "market", output : "1", idFilter: "format", selected: false),
                                      StaticSelectionableItem.init(text : "city", output : "2", idFilter: "format", selected: true),
                                      StaticSelectionableItem.init(text : "hyper", output : "3", idFilter: "format", selected: false)
  ]
  
  var ecouponsRayonValuesInitial  = [StaticSelectionableItem.init(text : "boucherie", output : "1", idFilter: "rayon", selected: false),
                                     StaticSelectionableItem.init(text : "boisson", output : "2", idFilter: "rayon", selected: true),
                                     StaticSelectionableItem.init(text : "boulangerie", output : "3", idFilter: "rayon", selected: false)
  ]
  
  var ecouponPriceValuesInitial  = [StaticSelectionableItem.init(text : "€", output : "1", idFilter: "price", selected: false),
                                    StaticSelectionableItem.init(text : "€€", output : "2", idFilter: "price", selected: true),
                                    StaticSelectionableItem.init(text : "€€€", output : "3", idFilter: "price", selected: false)
  ]
  
  /*****  Wishlist  **/
  var whislistFormatValuesInitial  = [StaticSelectionableItem.init(text : "market", output : "1", idFilter: "format", selected: false),
                                      StaticSelectionableItem.init(text : "city", output : "2", idFilter: "format", selected: true),
                                      StaticSelectionableItem.init(text : "hyper", output : "3", idFilter: "format", selected: false)
  ]
  
  var wishlistRayonValuesInitial  = [StaticSelectionableItem.init(text : "alimentation", output : "1", idFilter: "rayon", selected: false),
                                     StaticSelectionableItem.init(text : "poisson", output : "2", idFilter: "rayon", selected: true),
                                     StaticSelectionableItem.init(text : "boulangerie", output : "3", idFilter: "rayon", selected: false),
                                     StaticSelectionableItem.init(text : "television", output : "4", idFilter: "rayon", selected: false)
  ]
  
  var wishlistPriceValuesInitial  = [StaticSelectionableItem.init(text : "💰", output : "1", idFilter: "price", selected: false),
                                     StaticSelectionableItem.init(text : "💰💰", output : "2", idFilter: "price", selected: true),
                                     StaticSelectionableItem.init(text : "💰💰💰", output : "3", idFilter: "price", selected: false)
  ]
  
  /****  ***/
  
  
  
  
  
  var configParameters = [[FilterSpecializedCellType]]()
  
  
  var selectedElement = CarrefourContext.storeLocator
  
  @IBAction func filter(_ sender: Any) {
    showFilterController()
  }
  
  @IBAction func changeContext(_ sender: Any) {
    selectedElement = CarrefourContext(rawValue: segmentedContextSelection.selectedSegmentIndex)!
    switchConfig()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    storeLocatorConfig()
    self.initFilterViewController()
    
    
  }
  
  func ecouponsConfig() {
    self.configParameters = [
      [.custom(type : FilterSelectionType.radio, values : self.ecouponPriceValuesInitial, title : "prix de réduction :")],
      [.custom(type : FilterSelectionType.radio, values : self.ecouponsFormatValuesInitial, title : "selection de format :")],
      [.custom(type : FilterSelectionType.radio, values : self.ecouponsRayonValuesInitial, title : "selection de rayons :"),
       .custom(type: .swwitch, values: [StaticSelectionableItem.init(text: "mode expert", output: "true", idFilter: "mode expert_selected", selected: true)], title:"" )],
      [.validator]
    ]
  }
  
  func recetteConfig() {
    self.configParameters = [
      [.custom(type : FilterSelectionType.radio, values : self.recetteTimeValuesInitial, title : "temps de préparation")],
      [.custom(type : FilterSelectionType.multi, values : self.recetteBudgetValuesInitial, title : "budget")],
      [.custom(type : FilterSelectionType.radio, values : self.recetteDifficultyValuesInitial, title : "difficulté"),
       .custom(type: .swwitch, values: [StaticSelectionableItem.init(text: "mode expert", output: "true", idFilter: "mode expert_selected", selected: true)], title:"" )],
      [.validator]
    ]
  }
  
  func wishListConfig() {
    self.configParameters = [
      [.custom(type : FilterSelectionType.multi, values : self.wishlistPriceValuesInitial, title : "Prix")],
      [.custom(type : FilterSelectionType.radio, values : self.wishlistRayonValuesInitial, title : "Rayon :")],
      [.custom(type : FilterSelectionType.multi, values : self.whislistFormatValuesInitial, title : "Format :")],
      [.validator]
    ]
  }
  
  
  
  func storeLocatorConfig() {
    
    
    self.configParameters = [
     // [.custom(type : FilterSelectionType.radio, values : budgetType.convertTypeToFilterItem(entry: budgetType.self), title : budgetType.title())],
      [.custom(type : FilterSelectionType.multi, values : self.storeCountValuesInitial, title : "Nombre de Magasins")],
     // [.custom(type: .swwitch, values: [StaticSelectionableItem.init(text: "Drive", output: "false", idFilter: "drive_selected", selected: true)], title:"Drive" )],
    //  [.custom(type: .swwitch, values: [StaticSelectionableItem.init(text: "Banque", output: "false", idFilter: "banque_selected", selected: true)], title:"" )],
      [.validator]
    ]
    
  }
  
  func switchConfig() {
    switch selectedElement {
    case .coupons:
      ecouponsConfig()
      self.initFilterViewController()
      
      
    case .storeLocator:
      storeLocatorConfig()
      self.initFilterViewController()
      
    case .wishlist:
      wishListConfig()
      self.initFilterViewController()
      
    }
  }
  
  func initFilterViewController() {
    filterTableViewController = FilterGenericTableViewController.init(style : UITableViewStyle.grouped)
    filterTableViewController?.config = configParameters
    filterTableViewController?.delegate = self
    filterTableViewController?.title = "Filtres"
    filterTableViewController?.theme = selectedElement.theme()
    
    
    filterVC = UINavigationController.init(rootViewController: filterTableViewController!)
  }
  
  func showFilterController() {
    guard let filterVCSafe = filterVC else {
      let alertEligible = UIAlertView(title: "filter not initialise properly", message: "", delegate: nil, cancelButtonTitle: "Ok")
      alertEligible.show()
      return
    }
    
    switch selectedElement {
    default:
      navigationController?.present(filterVCSafe, animated: true, completion: nil)
    }
  }
}

