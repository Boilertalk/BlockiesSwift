//
//  ViewController.swift
//  BlockiesSwift
//
//  Created by Koray Koska on 12/19/2017.
//  Copyright (c) 2017 Koray Koska. All rights reserved.
//

import UIKit
import BlockiesSwift

class ViewController: UIViewController {

    @IBOutlet weak var blockiesImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let b = Blockies(seed: "0xfb6916095ca1df60bb79ce92ce3ea74c37c5d359", size: 8, scale: 3)
        // let b = Blockies(size: 210, scale: 30)
        let image = b.createImage(customScale: 10)
        blockiesImageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
