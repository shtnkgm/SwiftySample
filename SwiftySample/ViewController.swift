//
//  ViewController.swift
//  SwiftySample
//
//  Created by Shota Nakagami on 2018/11/18.
//  Copyright © 2018 Shota Nakagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let priceValue = 1000
        print(priceValue.priceString1 ?? "-" + "円")
        print(priceValue.priceString2 + "円")
    }
}

