//
//  Model.swift
//  CodableMapper
//
//  Created by Fayyaz.
//

import Foundation

class DashboardList:NSObject,Codable{
    var categoryId: String           = ""
    var categoryName:String          = ""
    var menuList:[MenuList]?
    
    func mapValue(json:NSDictionary) -> Any{
        let obj = DashboardList()
        obj.categoryId            = "\(json["categoryId"] ?? "")"
        obj.categoryName         = "\(json["categoryName"] ?? "")"
        obj.menuList       = MenuList.parsingArray(arr: json["menuList"] as? NSArray ?? NSArray())
        
        return obj
    }
    
    class func parsingDictionary(dicToParse: NSDictionary) -> DashboardList {
        return DashboardList().mapValue(json: dicToParse) as! DashboardList
        
    }
    
    class func parsingArray(arr: NSArray) -> [DashboardList] {
        return arr.map { (dict)  -> DashboardList in
            let dicToParse = dict as! NSDictionary
            return DashboardList().mapValue(json: dicToParse) as! DashboardList
        }
    }
    
}


class MenuList:NSObject,Codable{
    var id:String            = ""
    var name:String          = ""
    var imageUrl:String      = ""
    var colorCode:String     = ""
    var enableStatus:String  = ""
    var webURLStatus:String  = ""
    var webURL:String        = ""
    var isShow:Boolean = false
    
    
    func mapValue(json:NSDictionary) -> Any{
        let obj = MenuList()
        obj.id              = "\(json["id"] ?? "")"
        obj.name            = "\(json["name"] ?? "")"
        obj.imageUrl        = "\(json["imageUrl"] ?? "")"
        obj.colorCode       = "\(json["colorCode"] ?? "")"
        obj.enableStatus    = "\(json["enableStatus"] ?? "")"
        obj.webURLStatus    = "\(json["webURLStatus"] ?? "")"
        obj.webURL          = "\(json["webURL"] ?? "")"
        obj.isShow          = json["isShow"] ?? false
        
        return obj
    }
    
    class func parsingDictionary(dicToParse: NSDictionary) -> MenuList {
        return MenuList().mapValue(json: dicToParse) as! MenuList
        
    }
    
    class func parsingArray(arr: NSArray) -> [MenuList] {
        return arr.map { (dict)  -> MenuList in
            let dicToParse = dict as! NSDictionary
            return MenuList().mapValue(json: dicToParse) as! MenuList
        }
    }
}
