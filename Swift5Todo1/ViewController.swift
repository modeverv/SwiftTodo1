//
//  ViewController.swift
//  Swift5Todo1
//
//  Created by seijiro on 2019/03/25.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {

  @IBOutlet var tableView: UITableView!
  var resultArray = [String]()
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return resultArray.count
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = UIColor.clear
    cell.selectionStyle = UITableViewCell.SelectionStyle.none
    cell.textLabel?.text = resultArray[indexPath.row]
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      resultArray.remove(at: indexPath.row)
      UserDefaults.standard.set(resultArray,forKey: "todo")
      tableView.reloadData()
    }

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableView.delegate = self
    tableView.dataSource = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if UserDefaults.standard.object(forKey: "todo") != nil {
      resultArray = UserDefaults.standard.object(forKey: "todo") as! [String]
    }
    tableView.reloadData()

  }


}

