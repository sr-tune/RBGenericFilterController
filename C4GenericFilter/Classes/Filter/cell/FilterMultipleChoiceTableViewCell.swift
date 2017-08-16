//
//  FilterMultipleChoiceTableViewCell.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 03/08/2016.
//  Copyright © 2016 Carrefour. All rights reserved.
//

import UIKit

enum InternalType {
  case short
  case long
}


class FilterMultipleChoiceTableViewCell: FilterGenericCell {
  
  var columnNumber: CGFloat = 4
  var viewModel : FilterMultipleChoiceCellViewModel?
  var cview : UICollectionView?
  var interType = InternalType.short
  
  var outputParameters : [String] = []
  var outputParameter : SearchParamOutputModel<Any>?
  var lblTitle = UILabel()
  var previousSelectedArray = [IndexPath]()
  
  var styleTemplate : FilterTheme = DefaultThemeType()
  
  
  override func configureWithType(_ type: FilterSpecializedCellType, theme: FilterTheme) {
    self.type = type
    self.styleTemplate = theme
    
   // addObservers()
    configureCellOutlets()
  }
  
  func addObservers() {
    NotificationCenter().addObserver(self, selector: #selector(reloadCell), name: NSNotification.Name(rawValue: "CancelButtonPushed"), object: nil)
  }
  
  
  func configureCellOutlets() {
    switch type {
    case.custom(let type, let values, let title):
      
      guard values.count > 0 else {
        return
      }
      
      viewModel = FilterMultipleChoiceCellViewModel.init(injectedValues: values, title: title)
      initPreviousSelectedArrayWithFilterDefaultValue()
      
      manageOutletsBetweenLongAndShortTypeList(type)
      
    default: break
    }
  }
  
  func manageOutletsBetweenLongAndShortTypeList(_ type : FilterSelectionType) {
    switch type {
    case .radio:
      
      //      if (viewModel?.items.count)! > 12 {
      //        interType = .long
      //        updateSimpleCellOutlets()
      //      } else {
      interType = .short
      manageNumberOfColumnInCollectionView()
      updateCollectionViewCellOutlets()
      cview?.allowsMultipleSelection = false
      // }
      
    case .multi:
      //      if (viewModel?.items.count)! > 12 {
      //        interType = .long
      //        updateSimpleCellOutlets()
      //      } else {
      interType = .short
      manageNumberOfColumnInCollectionView()
      
      updateCollectionViewCellOutlets()
      cview?.allowsMultipleSelection = true
      // }
      
    default:
      return
    }
  }
  
  func manageNumberOfColumnInCollectionView() {
    if (viewModel?.items.count)! < 4 {
      if columnNumber != 3 {
        columnNumber = 3
      }
    }
      //    else if (viewModel?.items.count)! > 3 && (viewModel?.items.count)! < 12 {
      //      if columnNumber != 4 {
      //        columnNumber = 4
      //      }
      //    }
    else if (viewModel?.items.count)! > 3 {
      if columnNumber != 4 {
        columnNumber = 4
      }
    }
  }
  
  class CustomSet<T: Equatable> {
    var items = [T]()
    
    func hasItem (that: T) -> Bool {
      // No builtin Array method of hasItem...
      //   because comparison is undefined in builtin Array
      for this: T in items {
        if (this == that) {
          return true
        }
      }
      return false
    }
    
    func insert(that: T) {
      if (!hasItem(that: that)){
        items.append(that)
      }
    }
  }
  
  //  func updateSimpleCellOutlets() {
  //    addSimpleCellOutlets()
  //  }
  //
  //  func addSimpleCellOutlets() {
  //    textLabel?.text = viewModel?.title
  //    textLabel?.textColor = styleTemplate.color
  //    textLabel?.font = styleTemplate.font
  //    detailTextLabel?.text = "3 selected"
  //    self.accessoryType = .disclosureIndicator
  //    self.selectionStyle = .gray
  //  }
  
  
  func updateCollectionViewCellOutlets() {
   // cview?.reloadData()
    removeAllOutlets()
    addCollectionViewCellOutlets()
  }
  
  func initPreviousSelectedArrayWithFilterDefaultValue() {
    let indexes = (viewModel?.items.enumerated().map { (index, element) -> IndexPath? in
      if element.selected {
        return IndexPath.init(row: index, section: 0)
      }
      
      return IndexPath.init()
      })
    
    
    previousSelectedArray = indexes! as! [IndexPath]
  }
  
  func addCollectionViewCellOutlets() {
    self.selectionStyle = .none
    
    func addConstraintsOnOutlets() {
      
      let height = ceil(CGFloat((viewModel?.items.count)!)/columnNumber) * heightCalculationForCollectionView()  // 1 row
      //let height =  (cview?.collectionViewLayout.collectionViewContentSize.height)! + 1.0
      
      contentView.addConstraints(NSLayoutConstraint .constraints(withVisualFormat: "V:|-10-[title]-10-[cv(height)]-10-|",
                                                                 options: NSLayoutFormatOptions.init(rawValue: 0),
                                                                 metrics: ["height" : height],
                                                                 views: ["title" : lblTitle, "cv" : cview!]))
      
      
      print("contentsize : \(cview?.collectionViewLayout.collectionViewContentSize)" )
      
      // cview?.showRedBorder()
      cview?.alignRightInSuperViewWithMarging(10)
      cview?.alignLeftInSuperViewWithMarging(10)
    }
    
    
    func addTitleLabel() {
      lblTitle.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(lblTitle)
      
      lblTitle.centerHorizontalyInSuperview()
      lblTitle.text = viewModel?.title
      lblTitle.textColor = styleTemplate.color
      lblTitle.font = styleTemplate.font
    }
    
    func addCollectionView() {
      
      func initializeCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        let cv = UICollectionView.init(frame: contentView.frame, collectionViewLayout: layout)
        
        let podBundle = Bundle(for: FilterCollectionViewCell.self)
        
        cview = cv
        cview!.register(UINib.init(nibName: String(describing: FilterCollectionViewCell.self), bundle: podBundle), forCellWithReuseIdentifier: String(describing: FilterCollectionViewCell.self))
        
        cview!.backgroundColor = UIColor.white
        
        cview?.dataSource = self as! UICollectionViewDataSource
        cview?.allowsSelection = true
        cview?.delegate = self as! UICollectionViewDelegate
      }
      
      initializeCollectionView()
      cview!.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(cview!)
      
    }
    
    addCollectionView()
    addTitleLabel()
    
    cview?.layoutSubviews()
    addConstraintsOnOutlets()
  }
  
  func reloadCell() {
    cview?.reloadData()
  }
  
  override func selection() -> SearchParamOutputModel<Any>? {
    
    outputParameters.removeAll()
    previousSelectedArray.removeAll()
    
    let numberOfCells = (cview?.numberOfItems(inSection: 0))! as Int
    
    for  index in  0..<numberOfCells {
      let cell = cview?.cellForItem(at: IndexPath.init(row: index, section: 0)) as! FilterCollectionViewCell
      
      if cell.isSelected, let itemSafe = cell.item {
        outputParameters.append(itemSafe.genericOutput)
        
        let index = cview?.indexPath(for: cell)
        previousSelectedArray.append(index!)
      }
    }
    
    if outputParameters.count == 0 {
      return nil
    }
    
    outputParameter = SearchParamOutputModel.init(withKey: (viewModel?.idFilter)!, value: outputParameters) // delete !
    
    return outputParameter
  }
  
  override func reinit() {
    outputParameters.removeAll()
    previousSelectedArray.removeAll()
    
    let numberOfCells = (cview?.numberOfItems(inSection: 0))! as Int
    
    for  index in  0..<numberOfCells {
      if let cell = cview?.cellForItem(at: IndexPath(row: index, section: 0)) as? FilterCollectionViewCell,
        cell.isSelected {
        cview?.deselectItem(at: IndexPath(row: index, section: 0), animated: false)
      }
    }
  }
  
  override func cancel() {
    print(previousSelectedArray)
    reloadCell()
    
  }
  
}



