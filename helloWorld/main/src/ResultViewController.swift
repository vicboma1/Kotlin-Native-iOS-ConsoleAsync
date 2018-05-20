//
//  ResultViewController.swift
//  helloWorld
//
//  Created by Victor Bolinches Marin on 18/05/2018.
//  Copyright © 2018 Victor Bolinches Marin. All rights reserved.
//


import UIKit
import KotlinNativeFramework

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lb: UILabel!
    
    @IBOutlet weak var lb2: UILabel!
    
    var params : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(params)
        let hi = KNFKotlinNativeFramework().hi()
        lb.text = hi
        lb2.text = params
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
