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
        
        let apiClient1 = APIClient1()
        apiClient1.request() { value, error in
            if let error = error {
                print(error)
                return
            }
            if let value = value {
                print(value)
            }
        }
        
        let apiClient2 = APIClient2()
        apiClient2.request() { result in
            switch result {
            case .failure(let error):
                switch error {
                case .connectionError:
                    print("通信状況の良いところで再度お試しください")
                case .noLogin:
                    print("ログインしてください")
                }
            case .success(let value):
                print(value)
            }
        }
    }
}

