//
//  ViewController.swift
//  spin-arrow
//
//  Created by lucasmpaim1@gmail.com on 10/25/2017.
//  Copyright (c) 2017 lucasmpaim1@gmail.com. All rights reserved.
//

import UIKit
import SpinArrow

class ViewController: UIViewController {
    
    private var angle: Double = 90.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let i = 6
        
        let pointer = PointerView()
            pointer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            pointer.frame = CGRect(x: 100, y: 300, width: 200, height: 10)
            pointer.rotate(angle: angle * Double(i))
            view.addSubview(pointer)
                    
            UIView.animate(withDuration: 3.0, animations: { () -> Void in
                let angle = self.angle * Double(i) + Double.pi
                pointer.rotate(angle: angle)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

