//
//  GenericMultiChoiceTableViewController.swift
//  Pods
//
//  Created by rboyer on 14/08/2017.
//
//

import UIKit

protocol GenericLongListtableViewFilterDelegate {
  
  func didValidateSelection(viewModel : (cells : [FilterSelectionableItem], selectedIndex : [Bool]), parentType : FilterSpecializedCellType)
  func didCancelSelection(viewModel : (cells : [FilterSelectionableItem], selectedIndex : [Bool]), parentType : FilterSpecializedCellType)
}

class GenericMultiChoiceTableViewController: UITableViewController {
  
  var items = [FilterSelectionableItem]()
  var type = FilterSelectionType.multi
  
  var parentType : FilterSpecializedCellType?
  var delegate : GenericLongListtableViewFilterDelegate?
  var viewModel : (cells : [FilterSelectionableItem], selectedIndex : [Bool])?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    customiseTableView()
    addBackButton()
    addRightButtons()
    
    initViewModel()
    
  }
  
  func initViewModel() {
    if viewModel == nil  {
      viewModel = (items, items.map { _ in return false } )
    }
  }
  
  func addRightButtons() {
    let okButton = UIBarButtonItem.init(title: "Ok", style: .plain, target: self, action: #selector(saveAction))
    let reinitButton = UIBarButtonItem.init(title: "RAZ", style: .plain, target: self, action: #selector(reinitViewModel))
    navigationItem.rightBarButtonItems = [okButton,reinitButton]
    
  }
  
  func saveAction() {
    guard let parentTSafe = parentType else {
      return
    }
    
    self.delegate?.didValidateSelection(viewModel: viewModel!, parentType: parentTSafe)
    self.navigationController?.popViewController(animated: true)
  }
  
  
  func reinitViewModel() {
    viewModel?.selectedIndex = items.map { _ in return false }
    tableView.reloadData()
  }
  
  func customiseTableView() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuse")
    tableView.allowsMultipleSelection = (type == .multi)
    tableView.showsVerticalScrollIndicator = false
  }
  
  func backAction() {
    guard let parentTSafe = parentType else {
      return
    }
    self.delegate?.didCancelSelection(viewModel: viewModel!, parentType: parentTSafe)
    navigationController?.popViewController(animated: true)
  }
  
  func addBackButton() {
    let backButton = UIBarButtonItem.init(title: "< Filtres", style: .plain, target: self, action: #selector(backAction))
    navigationItem.leftBarButtonItem = backButton
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count ?? 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
    
    cell = cell ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "reuse")
    cell.textLabel?.text = viewModel?.cells[indexPath.row].textForLabel
    cell.imageView?.image = viewModel?.cells[indexPath.row].image

    
    if (viewModel?.selectedIndex[indexPath.row])! {
      cell.accessoryType = .checkmark
    }
    else {
      cell.accessoryType = .none
    }
    
    
    return cell
  }
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    
    switch type {
    case .multi:
      if cell?.accessoryType == .checkmark {
        cell?.accessoryType = .none
        viewModel?.selectedIndex[indexPath.row] = false

      }
      else {
        cell?.accessoryType = .checkmark
        viewModel?.selectedIndex[indexPath.row] = true

      }
      
      
    case .radio:
      reinitViewModel()
      
      if cell?.accessoryType == .checkmark {
        cell?.accessoryType = .none
      }
      else {
        viewModel?.selectedIndex[indexPath.row] = true
        cell?.accessoryType = .checkmark
      }

      
    default :
      cell?.accessoryType = .none

    }
    
  }
  
  
  
}
