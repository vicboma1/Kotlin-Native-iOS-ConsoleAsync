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

    var kotlinFwk = (UIApplication.shared.delegate as! AppDelegate).kotlinFwk

    var params : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let hi = kotlinFwk.hi()
        lb.text = hi
        lb2.text = params

        kotlinFwk.printAsync(str : "viewDidLoad : \(hi)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        kotlinFwk.printAsync(str : "didReceiveMemoryWarning")

    }
    
}
