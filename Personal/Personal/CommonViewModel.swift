//
//  CommonViewModel.swift
//  Personal
//
//  Created by wangbinji on 2023/3/6.
//

import Foundation

class Sects: NSObject {
    
    var rows: Array<BaseViewModel>
    
    init(rows: Array<BaseViewModel>) {
        self.rows = rows
    }
}

// ViewModel
class BaseViewModel: NSObject {
    
    var indexPath: IndexPath?
    
    func reuseIdentifier() -> String {
        return "BaseViewModel"
    }
    
    override init() {
        super.init()
    }
}

class VideoViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "VideoViewModel"
    }
    
    override init() {
        super.init()
    }
}

class ErrorViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "ErrorViewModel"
    }
    
    override init() {
        super.init()
    }
}

class CardViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "CardViewModel"
    }
    
    override init() {
        super.init()
    }
}

class EatOrFoodViewModel: BaseViewModel {
    override func reuseIdentifier() -> String {
        return "EatOrFoodViewModel"
    }
    
    override init() {
        super.init()
    }
}

class PlanOrAddFoldViewModel: BaseViewModel {
    
    var foldEvents: ((Int)->Void)?
    
    var isFold: Bool?
    
    
    override func reuseIdentifier() -> String {
        return "PlanOrAddFoldViewModel"
    }
    
    override init() {
        super.init()
    }
    
    init(foldEvents:@escaping (Int)->Void) {
        self.foldEvents = foldEvents
    }
}

class PlanOrAddUnFoldViewModel: BaseViewModel {
    
    var unFoldEvents: ((Int)->Void)?
    
    var isFold: Bool = false
    
    override func reuseIdentifier() -> String {
        return "PlanOrAddUnFoldViewModel"
    }
    
    override init() {
        super.init()
    }
    
    init(unfoldEvents:@escaping (Int)->Void) {
        self.unFoldEvents = unfoldEvents
    }
}
