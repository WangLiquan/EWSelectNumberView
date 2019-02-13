//
//  ViewController.swift
//  EWSelectNumberView
//
//  Created by Ethan.Wang on 2019/2/13.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let selectNumberView: EWSelectNumberView = EWSelectNumberView(frame: CGRect(x: 100, y: 300, width: 96, height: 24), defaultNumber: 99, maxNumber: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(selectNumberView)
    }


}

