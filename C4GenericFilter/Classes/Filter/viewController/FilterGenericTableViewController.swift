//
//  FilterGenericTableViewController.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 04/08/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit

public protocol FilterGenericTableViewDelegate {
  func filterAdded(_ filterParams : NSDictionary)
  func filterDidCancel()
}

public class FilterGenericTableViewController: UITableViewController {
  
  public var theme : FilterTheme = DefaultThemeType()
  public var delegate : FilterGenericTableViewDelegate!
  var viewModel : FilterGenericTableViewModel?
  
  
  var longListViewModel : (viewModels :[(cells: [FilterSelectionableItem], selectedIndex: [Bool])], parents : [FilterSpecializedCellType])?
  
  public var config : [[FilterSpecializedCellType]] = []
  var filterParams = [SearchParamOutputModel<Any>]()
  
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    initLongListViewModel()
    
    viewModel = FilterGenericTableViewModel(withConfig: config)
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 140
    
    self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Annuler", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelFilterSelection))
    
    addDismissKeyBoardGesture()
  }
  
  public override func viewDidAppear(_ animated: Bool) {
    
    tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: .top, animated: true)
    
//    if tableView.indexPathForSelectedRow != nil {
//      tableView.deselectRow(at:tableView.indexPathForSelectedRow!, animated: true)
//    }
  }
  
  func initLongListViewModel() {
    if longListViewModel == nil {
      longListViewModel = ([([],[])],[])
    }
  
  }
  
  func addDismissKeyBoardGesture() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FilterGenericTableViewController.dismissKeyboard))
    self.navigationController?.navigationBar.addGestureRecognizer(tap)
    
  }
  
  public override func numberOfSections(in tableView: UITableView) -> Int {
    return config.count
  }
  
  
  override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //TODO: virer l'unwrap ici
    return (viewModel?.arrayOfCellForFilter[section].count)!
  }
  
  
  override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = (viewModel?.arrayOfCellForFilter[indexPath.section][indexPath.row])! as FilterGenericCell
    cell.configureWithType(config[indexPath.section][indexPath.row], theme: theme)
    
    //TODO: bouger ce traitement dans la cell
    if cell.isKind(of: FilterValidationCell.self) {
      let cell2  = cell as! FilterValidationCell
      cell2.delegate = self
      cell = cell2
    }
    //------
        
    return cell
  }
  
  func dismissKeyboard() {
    //Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
  
  
  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as? FilterMultipleChoiceTableViewCell
    
    cell?.isSelected = true
    
    if let cellsafe = cell {
      
      var tableViewGenericController = GenericMultiChoiceTableViewController.init(style: .plain)
      tableViewGenericController.items = (cell?.viewModel?.items)!
      tableViewGenericController.delegate = self
      
      if cellsafe.interType == InternalType.long {
        
        switch cellsafe.type {
        case .custom(let typeOfCell, let values, let title):
          
          
//          if let vmSafe = longListViewModel?.viewModels {
//            if vmSafe.count > 0 {
//              let viewModelFiltered = vmSafe.filter {
//                return $0.cells[0].idFilter == values[0].idFilter
//              }
//              
//              tableViewGenericController.viewModel = viewModelFiltered[0]
//            }
//
//          }
          
          
          tableViewGenericController.type = typeOfCell
          tableViewGenericController.parentType = cellsafe.type
          
        default: break
        }
        
        navigationController?.pushViewController(tableViewGenericController, animated: true)
      }
    }
  }
  
  
  public override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    var cell = tableView.cellForRow(at: indexPath)

    cell?.detailTextLabel?.text = "\(longListViewModel?.viewModels[0].selectedIndex.count) selectionné(s)"
  }
}


extension FilterGenericTableViewController : GenericLongListtableViewFilterDelegate {

  func didValidateSelection(viewModel : (cells : [FilterSelectionableItem], selectedIndex : [Bool]), parentType : FilterSpecializedCellType) {
    longListViewModel?.viewModels.append(viewModel)
    longListViewModel?.parents.append(parentType)
  }
  
  
  func didCancelSelection(viewModel : (cells : [FilterSelectionableItem], selectedIndex : [Bool]), parentType : FilterSpecializedCellType) {
    longListViewModel?.viewModels.append(viewModel)
    longListViewModel?.parents.append(parentType)
  }
}



