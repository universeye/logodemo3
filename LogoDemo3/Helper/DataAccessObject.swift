//
//  DataAccessObject.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/7/9.
//

import Foundation
import UIKit

class DataAccessObject: NSObject {
    
    static let sharedInstance = DataAccessObject()
    
    private let internalQueue = DispatchQueue(label: "SingletionInternalQueue", qos: .default, attributes: .concurrent)
    private var _dataCount: Int = 0
    
    var dataCount: Int {
        get {
            return internalQueue.sync {
                _dataCount
            }
        }
        
        set(newValue) {
            // barrier flag => 告訴佇列，這個特定工作項目，必須在沒有其他平行執行的項目時執行
            internalQueue.async(flags: .barrier) {
                self._dataCount = newValue
            }
        }
    }
    
    private override init() {
        print("init...")
    }
    
    deinit {
        print("deinit...")
    }
    
    func loadDatas() {
        print("loadDatas...")
    }
}
