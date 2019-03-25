//
//  addViewController.swift
//  Swift5Todo1
//
//  Created by seijiro on 2019/03/25.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit

class addViewController: UIViewController,UITextFieldDelegate {

  var array = [String]();

  @IBOutlet var textField: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()

    textField.delegate = self
        // Do any additional setup after loading the view. 

    }
    

  @IBAction func add(_ sender: Any) {
    //現在の配列
    if(UserDefaults.standard.object(forKey: "todo")) != nil {
      array = UserDefaults.standard.object(forKey: "todo") as! [String]
    }
    array.append(textField.text!)
    UserDefaults.standard.set(array, forKey: "todo")
    //戻る
    self.navigationController?.popViewController(animated: true)

  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
