//
//  EWSelectNumberView.swift
//  EWSelectNumberView
//
//  Created by Ethan.Wang on 2019/2/13.
//  Copyright © 2019 Ethan. All rights reserved.
//

import UIKit

class EWSelectNumberView: UIView {
    /// 修改数量回调,减回调false,加回调true
    public var backEditNumber: ((Bool) -> Void)?
    /// 最大显示数,可以通过初始化设置
    private var maxSelectNumber: Int = 99
    /// 选择数量,private,外部不可调用
    private(set) var selectedNumber: Int = 1 {
        /// 当选择数量修改时进行显示label的文字修改,以及加减按钮的状态修改.
        didSet {
            self.subtractButton.isEnabled = selectedNumber == 1 ? false : true
            self.addButton.isEnabled = selectedNumber == maxSelectNumber ? false : true
            self.showLabel.text = "\(selectedNumber)"
        }
    }
    /// 左侧减按钮
    private let subtractButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.tag = 0
        button.setBackgroundImage(UIImage(named: "selectNumber_subtractIsEnableTrue"), for: .normal)
        button.setBackgroundImage(UIImage(named: "selectNumber_subtractIsEnableFalse"), for: .disabled)
        return button
    }()
    /// 中间显示label
    private lazy var showLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        label.text = "\(selectedNumber)"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    /// 右侧加按钮
    private let addButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setBackgroundImage(UIImage(named: "selectNumber_addEnableTrue"), for: .normal)
        button.setBackgroundImage(UIImage(named: "selectNumber_addEnableFalse"), for: .disabled)
        return button
    }()

    init(frame: CGRect, defaultNumber: Int = 1, maxNumber: Int = 99) {
        /// 加入frame限制,保证按钮size小于view.width*1/3,保证显示效果
        let frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height < frame.width/3 ? frame.height : frame.width/3)
        super.init(frame: frame)
        self.maxSelectNumber = maxNumber
        self.setValue(defaultNumber, forUndefinedKey: "selectedNumber")
        drawMyView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 重写kvo方法才能完成赋值,不然不调用didSet方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        guard let selectedNumber = value as? Int else {
            return
        }
        self.selectedNumber = selectedNumber
    }

    private func drawMyView() {
        let buttonWidth = self.frame.height
        self.addSubview(subtractButton)
        subtractButton.addTarget(self, action: #selector(onClickChangeButton(sender:)), for: .touchUpInside)
        subtractButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonWidth)
        self.addSubview(addButton)
        addButton.addTarget(self, action: #selector(onClickChangeButton(sender:)), for: .touchUpInside)
        addButton.frame = CGRect(x: self.frame.width - buttonWidth, y: 0, width: buttonWidth, height: buttonWidth)
        self.addSubview(showLabel)
        showLabel.frame = CGRect(x: buttonWidth, y: 0, width: self.frame.width - buttonWidth * 2, height: buttonWidth)
    }
    /// 点击加减按钮
    @objc private func onClickChangeButton(sender: UIButton) {
        switch sender.tag {
        case 0:
            self.selectedNumber -= 1
            if backEditNumber != nil {
                backEditNumber!(false)
            }
        case 1:
            self.selectedNumber += 1
            if backEditNumber != nil {
                backEditNumber!(true)
            }
        default:
            break
        }
    }
}
