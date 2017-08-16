//
//  GenericFilterResultsTableViewController.swift
//  C4GenericFilter
//
//  Created by rboyer on 09/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

protocol GenericResult {
  var title : String { get}
  var desc : String { get }
  var img : UIImage { get }
}


class GenericFilterResultsTableViewController: UITableViewController {
  
  var viewModel : [GenericResult]
  
  init(results : [GenericResult]) {
    self.viewModel = results
    super.init(style: .plain)
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.viewModel = [GenericResult]()
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return viewModel.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "genericResultReuse", for: indexPath)
    
    cell.textLabel?.text = viewModel[indexPath.row].title
    cell.detailTextLabel?.text = viewModel[indexPath.row].desc
    cell.imageView?.image = viewModel[indexPath.row].img

    return cell
  }
  
}
