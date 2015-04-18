//
//  ShowViewController.swift
//  CoreDataTest2
//
//  Created by xlx on 15/4/18.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit
import CoreData
class ShowViewController: UIViewController {

    @IBOutlet weak var Avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var favoriteColor: UIView!
    var managedContext:NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        //2
        let request = NSFetchRequest(entityName:"Test")
        var error: NSError? = nil
        var results = managedContext.executeFetchRequest(request, error: &error) as! [Test]!
        //3
        let TestObject=results[results.count-1]
        let name = TestObject.name
        let age = TestObject.age
        let birthday = TestObject.birthday
        let favoriteColor:UIColor = TestObject.favoriteColor as! UIColor
        let avatar = UIImage(data: TestObject.avatar)
        //4
        self.Avatar=UIImageView(image: avatar)
        self.name.text = name
        self.age.text = "\(age)"
        //格式化输出生日
        var fmt=NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let birthdayString = fmt.stringFromDate(birthday)
        self.birthday.text = birthdayString
        self.favoriteColor.backgroundColor = favoriteColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
