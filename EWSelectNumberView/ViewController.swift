//
//  ViewController.swift
//  EWSelectNumberView
//
//  Created by Ethan.Wang on 2019/2/13.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let selectNumberView: EWSelectNumberView = EWSelectNumberView(frame: CGRect(x: 100, y: 200, width: 96, height: 24), defaultNumber: 99, maxNumber: 100)

    private let selectNumberView2: EWSelectNumberView = EWSelectNumberView(frame: CGRect(x: 89, y: 300, width: 150, height: 70), defaultNumber: 5, maxNumber: 100)

    private let selectNumberView3: EWSelectNumberView = EWSelectNumberView(frame: CGRect(x: 96, y: 400, width: 200, height: 30), defaultNumber: 1, maxNumber: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(selectNumberView)
        self.view.addSubview(selectNumberView2)
        self.view.addSubview(selectNumberView3)
    }


}

