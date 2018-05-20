//
//  ViewController.swift
//  helloWorld
//
//  Created by Victor Bolinches Marin on 17/05/2018.
//  Copyright © 2018 Victor Bolinches Marin. All rights reserved.
//

import UIKit
import KotlinNativeFramework

class ViewController: UIViewController {

    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    
    @IBAction func btnAction(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            if let secondViewController = segue.destination as? ResultViewController {
                secondViewController.params = KNFKotlinNativeFramework()
                    .fullName(f: first.text!, s: second.text!)

                first.text  = ""
                second.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
