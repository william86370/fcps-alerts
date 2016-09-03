//
//  ViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/8/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//
import UIKit

struct PullToRefreshConst {
    static let tag = 810
    static let alpha = true
    static let height: CGFloat = 80
    static let imageName: String = "snowflake.png"
    static let animationDuration: Double = 0.4
    static let fixedTop = true // PullToRefreshView fixed Top
}

public class PullToRefreshOption {
    public var backgroundColor = UIColor.clear()
    public var indicatorColor = UIColor.gray()
    public var autoStopTime: Double = 0.7 // 0 is not auto stop
    public var fixedSectionHeader = false  // Update the content inset for fixed section headers
    
    public init() {
    }
}
