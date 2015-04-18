//
//  ViewController.swift
//  CoreDataTest2
//
//  Created by xlx on 15/4/17.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var favoriteColor: UIView!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var Avatar: UIImageView!
    
    var managedContext:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addButton(sender: AnyObject) {
        //1
        let name = self.name.text
        let age  = self.age.text.toInt()!
        let favoriteColor=self.favoriteColor.backgroundColor!
        let birthday = self.birthday.date
        let avatar = self.Avatar.image!
        //2
        let entity = NSEntityDescription.entityForName("Test", inManagedObjectContext: managedContext)
        let TestObject = Test(entity: entity!, insertIntoManagedObjectContext: managedContext)
        //3
        TestObject.name=name
        TestObject.age=age
        TestObject.favoriteColor=favoriteColor
        TestObject.birthday=birthday
        let avatarData=UIImagePNGRepresentation(avatar)
        TestObject.avatar=avatarData
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error!.userInfo)")
            if error!.code == NSValidationNumberTooLargeError{
                println("值过大")
            }
            if error!.code == NSValidationNumberTooSmallError {
                println("值过小")
            }
        }
    }

    @IBAction func showButton(sender: AnyObject) {
    }

}

