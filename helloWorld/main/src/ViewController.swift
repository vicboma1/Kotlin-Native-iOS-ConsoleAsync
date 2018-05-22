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


    var kotlinFwk = (UIApplication.shared.delegate as! AppDelegate).kotlinFwk

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            if let secondViewController = segue.destination as? ResultViewController {
                secondViewController.params = kotlinFwk
                    .fullName(f: first.text!, s: second.text!)

                first.text  = ""
                second.text = ""

                kotlinFwk.printAsync(str:"prepare : \(secondViewController.params)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kotlinFwk.printAsync(str:"viewDidLoad ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        kotlinFwk.printAsync(str:"didReceiveMemoryWarning ")
    }

}
