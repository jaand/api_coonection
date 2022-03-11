//
//  ViewController.swift
//  apiFromurl
//
//  Created by Guest123 on 06/03/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let data = DataLoader().userData
        
        print(data)
    }


}

