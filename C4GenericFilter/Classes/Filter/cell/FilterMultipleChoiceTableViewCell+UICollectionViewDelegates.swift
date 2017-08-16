//
//  FilterMultipleChoiceTableViewCell+UICollectionViewDelegates.swift
//  Carrefour_FR_V2
//
//  Created by rboyer on 11/04/2017.
//  Copyright © 2017 Carrefour. All rights reserved.
//

import Foundation
import UIKit


extension FilterMultipleChoiceTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    guard let items = viewModel?.items else {
      return 0
    }
    
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    return cellConfigured(forIndexPath: indexPath)
  }
  
  func cellConfigured(forIndexPath indexPath : IndexPath) -> FilterCollectionViewCell {
    
    var cell = cview!.dequeueReusableCell(withReuseIdentifier: String(describing: FilterCollectionViewCell.self), for: indexPath) as? FilterCollectionViewCell
    
    if let cellSafe = cell
    {
      cellSafe.configureWith(item: (viewModel?.items[indexPath.row])!, theme: styleTemplate)
      autoselect(cell: cellSafe, atIndexPath: indexPath)
      
      return cellSafe
    } else {
      cell = FilterCollectionViewCell()
      cell?.configureWith(item: (viewModel?.items[indexPath.row])!, theme: styleTemplate)
      autoselect(cell: cell, atIndexPath: indexPath)
      return cell!
    }
  }
  

  func autoselect(cell : FilterCollectionViewCell?, atIndexPath indexPath : IndexPath) {
    
    guard let cellSafe = cell else {
      return
    }
    
    if !cellSafe.isSelected {
      if previousSelectedArray.contains(indexPath) {
        cview?.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        print(cview?.cellForItem(at: indexPath)?.isSelected)
        
      }
    } else if cellSafe.isSelected {
      if !previousSelectedArray.contains(indexPath) {
        cview?.deselectItem(at: indexPath, animated: false)

      }
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let itemWidthForScareLayer = ceil((UIScreen.main.bounds.size.width - 20)/columnNumber)
    return CGSize(width: itemWidthForScareLayer-1, height: itemWidthForScareLayer-1)
  }
  
  
  
  func heightCalculationForCollectionView() -> CGFloat {
    cview?.layoutSubviews()
    let cell = cview?.cellForItem(at: IndexPath.init(row: 0, section: 0)) as? FilterCollectionViewCell
    
    if let cellSafe = cell {
      return cellSafe.frame.size.height
    }
    
    return 200
  }
}


extension FilterMultipleChoiceTableViewCell : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }  
}





