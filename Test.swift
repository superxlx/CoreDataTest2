//
//  Test.swift
//  CoreDataTest2
//
//  Created by xlx on 15/4/18.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import Foundation
import CoreData

class Test: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var age: NSNumber
    @NSManaged var birthday: NSDate
    @NSManaged var avatar: NSData
    @NSManaged var favoriteColor: AnyObject

}
