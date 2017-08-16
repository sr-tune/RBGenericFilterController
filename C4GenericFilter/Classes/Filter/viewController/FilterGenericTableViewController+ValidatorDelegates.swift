//
//  FilterGenericTableViewController+ValidatorDelegates.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 14/04/2017.
//

import Foundation

extension FilterGenericTableViewController : FilterValidatorDelegate {
  func validateSelections() {
    
    for groupedCells in (viewModel?.arrayOfCellForFilter)! as [[FilterGenericCell]] {
      for cell in groupedCells {
        
        if let param = cell.selection() {
          filterParams.append(param)
        }
      }
    }
    
    let dictOfParams = convertFilterParamsToGlobalDictionnaryOfParams(params: filterParams)
    
    delegate.filterAdded(dictOfParams)
    filterParams.removeAll()
    
    dismiss(animated: true, completion: nil)
  }
  
  func convertFilterParamsToGlobalDictionnaryOfParams(params :[SearchParamOutputModel<Any>]?) -> NSDictionary {
    guard let safeParams = params else {
      return NSDictionary()
    }
    var returnedDict = NSMutableDictionary()
    
    
    for params in safeParams {
      
      if let paramsArray = params.output as? [String] {
        var array = Array<String>()
        for output in paramsArray {
          array.append(output)
        }
        returnedDict.setValue(array, forKey: params.key)
      }
      else {
        returnedDict.setValue(params.output, forKey: params.key)
      }
      
    }
    
    return returnedDict
    
  }
  
  func automaticSelection(_ cellType: FilterSpecializedCellType) {
//    let model = FilterOneChoiceCellViewModel.init(value: <#T##FilterSelectionableItem#>, type: <#T##FilterSpecializedCellType#>)
//    let outputParamStationServiceActif = SearchParamOutputModel(withKey: model.keyWS, stringVal: model.valueForWS!, isService: model.isService)
//    filterParams.append(outputParamStationServiceActif)
//    delegate.filterAdded(filterParams)
//    filterParams.removeAll()
  }
  
  func cancelFilterSelection() {
    // reload pré selection
   // tableView.reloadData()
    
    for groupedCells in viewModel?.arrayOfCellForFilter ?? [] {
      for cell in groupedCells {
        cell.cancel()
      }
    }
    
    delegate.filterDidCancel()
    dismiss(animated: true, completion: nil)
  }
  
  func reinitFilter() {
    
    for groupedCells in viewModel?.arrayOfCellForFilter ?? [] {
      for cell in groupedCells {
        cell.reinit()
      }
    }
    
    filterParams.removeAll()
  }
  
}
