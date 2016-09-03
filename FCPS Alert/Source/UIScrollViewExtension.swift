//
//  ViewController.swift
//  FCPS Alert
//
//  Created by william wright  on 12/8/15.
//  Copyright © 2015 A.R.C software and enginering. All rights reserved.
//
import Foundation
import UIKit

public extension UIScrollView {
    
    private var pullToRefreshView: PullToRefreshView? {
        get {
            let pullToRefreshView = viewWithTag(PullToRefreshConst.tag)
            return pullToRefreshView as? PullToRefreshView
        }
    }

    public func addPullToRefresh(_ refreshCompletion :(() -> ())) {
        self.addPullToRefresh(options: PullToRefreshOption(), refreshCompletion: refreshCompletion)
    }
    
    public func addPullToRefresh(options: PullToRefreshOption = PullToRefreshOption(), refreshCompletion :(() -> ())) {
        let refreshViewFrame = CGRect(x: 0, y: -PullToRefreshConst.height, width: self.frame.size.width, height: PullToRefreshConst.height)
        let refreshView = PullToRefreshView(options: options, frame: refreshViewFrame, refreshCompletion: refreshCompletion)
        refreshView.tag = PullToRefreshConst.tag
        addSubview(refreshView)
    }

    public func startPullToRefresh() {
        pullToRefreshView?.state = .refreshing
    }
    
    public func stopPullToRefresh() {
        pullToRefreshView?.state = .normal
    }
    
    // If you want to PullToRefreshView fixed top potision, Please call this function in scrollViewDidScroll
    public func fixedPullToRefreshViewForDidScroll() {
        if PullToRefreshConst.fixedTop {
            if self.contentOffset.y < -PullToRefreshConst.height {
                if var frame = pullToRefreshView?.frame {
                    frame.origin.y = self.contentOffset.y
                    pullToRefreshView?.frame = frame
                }
            } else {
                if var frame = pullToRefreshView?.frame {
                    frame.origin.y = -PullToRefreshConst.height
                    pullToRefreshView?.frame = frame
                }
            }
        }
    }
}
