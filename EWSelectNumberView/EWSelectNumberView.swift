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
    public var backEditNumber: ((Bool) -> ())?
    public var maxSelectNumber: Int = 99
    ///FIXME: 更新添加上限
    public var selectedNumber: Int = 1{
        didSet{
            self.subtractButton.isEnabled = selectedNumber == 1 ? false : true
            self.addButton.isEnabled = selectedNumber == maxSelectNumber ? false : true
            self.showLabel.text = "\(selectedNumber)"
        }
    }
    private let subtractButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.tag = 0
        button.setImage(UIImage(named: "selectNumber_subtractIsEnableFalse"), for: .disabled)
        button.setImage(UIImage(named: "selectNumber_subtractIsEnableTrue"), for: .normal)
        return button
    }()
    private lazy var showLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        label.text = "\(selectedNumber)"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    private let addButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setImage(UIImage(named: "selectNumber_addEnableTrue"), for: .normal)
        button.setImage(UIImage(named: "selectNumber_addEnableFalse"), for: .disabled)
        return button
    }()

    init(frame: CGRect, defaultNumber: Int = 1, maxNumber: Int = 99){
        super.init(frame: frame)
        self.maxSelectNumber = maxNumber
        self.setValue(defaultNumber, forUndefinedKey: "selectedNumber")
        drawMyView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 重写kvo方法才能完成赋值,不然报错
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        guard let selectedNumber = value as? Int else {
            return
        }
        self.selectedNumber = selectedNumber
    }

    private func drawMyView(){
        self.addSubview(subtractButton)
        subtractButton.addTarget(self, action: #selector(onClickChangeButton(sender:)), for: .touchUpInside)
        subtractButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        self.addSubview(addButton)
        addButton.addTarget(self, action: #selector(onClickChangeButton(sender:)), for: .touchUpInside)
        addButton.frame = CGRect(x: 68, y: 0, width: 24, height: 24)
        self.addSubview(showLabel)
        showLabel.frame = CGRect(x: 24, y: 0, width: 44, height: 24)
    }
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
