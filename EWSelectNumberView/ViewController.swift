//
//  ViewController.swift
//  EWSelectNumberView
//
//  Created by Ethan.Wang on 2019/2/13.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let showLabel1: UILabel = {
        let label = UILabel(frame: CGRect(x: 300, y: 200, width: 50, height: 24))
        return label
    }()
    let showLabel2: UILabel = {
        let label = UILabel(frame: CGRect(x: 300, y: 300, width: 50, height: 50))
        return label
    }()
    let showLabel3: UILabel = {
        let label = UILabel(frame: CGRect(x: 300, y: 430, width: 50, height: 30))
        return label
    }()

    private lazy var selectNumberView: EWSelectNumberView = {
       let view = EWSelectNumberView(frame: CGRect(x: 50, y: 200, width: 96, height: 24), defaultNumber: 99, maxNumber: 100)
        view.backEditNumber = { bool in
            var operation: String = bool == false ? "减" : "加"
            EWToast.showBottomWithText(text: "1号:\(operation)")
            self.showLabel1.text = "\(view.selectedNumber)"
        }
        return view
    }()

    private lazy var selectNumberView2: EWSelectNumberView = {
        let view = EWSelectNumberView(frame: CGRect(x: 39, y: 300, width: 150, height: 70), defaultNumber: 5, maxNumber: 100)
        view.backEditNumber = { bool in
            var operation: String = bool == false ? "减" : "加"
            EWToast.showBottomWithText(text: "2号:\(operation)")
            self.showLabel2.text = "\(view.selectedNumber)"
        }
        return view
    }()

    private lazy var selectNumberView3: EWSelectNumberView = {
        let view = EWSelectNumberView(frame: CGRect(x: 46, y: 430, width: 200, height: 30), defaultNumber: 1, maxNumber: 10)
        view.backEditNumber = { bool in
            var operation: String = bool == false ? "减" : "加"
            EWToast.showBottomWithText(text: "3号:\(operation)")
            self.showLabel3.text = "\(view.selectedNumber)"
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(showLabel1)
        showLabel1.text = "\(selectNumberView.selectedNumber)"
        self.view.addSubview(showLabel2)
        showLabel2.text = "\(selectNumberView2.selectedNumber)"
        self.view.addSubview(showLabel3)
        showLabel3.text = "\(selectNumberView3.selectedNumber)"
        self.view.addSubview(selectNumberView)
        self.view.addSubview(selectNumberView2)
        self.view.addSubview(selectNumberView3)
    }

}
