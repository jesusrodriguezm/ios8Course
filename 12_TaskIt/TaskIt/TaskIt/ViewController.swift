//
//  ViewController.swift
//  TaskIt
//
//  Created by Jesús on 23/11/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //with dictionaries:
    //var taskArray:[Dictionary<String,String>] = []
    //var taskArray:[TaskModel] = []
    //var baseArray:[[TaskModel]] = []
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    var fetchedResultsControler:NSFetchedResultsController = NSFetchedResultsController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //with dictionaries:
//        let task1:Dictionary<String,String> = ["task":"Study French", "subtask":"Verbs", "date":"01/14/2014"]
//        let task2:Dictionary<String,String> = ["task":"Eat Dinner", "subtask":"Burgers", "date":"01/14/2014"]
//        let task3:Dictionary<String,String> = ["task":"Gym", "subtask":"Leg day", "date":"01/14/2014"]
//        taskArray = [task1, task2, task3]
        
//        let date1 = Date.from(year: 2014, month: 05, day: 20)
//        let date2 = Date.from(year: 2014, month: 03, day: 3)
//        let date3 = Date.from(year: 2014, month: 12, day: 13)
//        //with strucs:
//        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1, completed:false)
//        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2, completed:false)
//        let taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3, completed:false)]
//        let completedArray = [TaskModel(task: "Code", subTask: "Task project", date: date2, completed: true)]
//        
//        baseArray = [taskArray, completedArray]
//        
//        self.tableView.reloadData()
        
        fetchedResultsControler = getFetchedResultsController()
        fetchedResultsControler.delegate = self
        fetchedResultsControler.performFetch(nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //sort with embebed function
//        func sortByDate (taskOne: TaskModel, taskTwo:TaskModel) -> Bool {
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        taskArray = taskArray.sorted(sortByDate)
//        
//        for var i = 0; i < baseArray.count; i++ {
//            //sort with closure
//            baseArray[i] = baseArray[i].sorted {
//                (taskOne: TaskModel, taskTwo:TaskModel) -> Bool in
//                //comparision logic here:
//                return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//            }
//        }
//        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            //this also could be sended in the "sender" argument...
            //let thisTask = baseArray[indexPath!.section][indexPath!.row]
            let thisTask = fetchedResultsControler.objectAtIndexPath(indexPath!) as TaskModel
            detailVC.detailTaskModel = thisTask
            //detailVC.mainVC = self
        }
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            //addTaskVC.mainVC = self
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    //UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return baseArray.count
        return fetchedResultsControler.sections!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return baseArray[section].count
        return fetchedResultsControler.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //with dictionaries:
        //let taskDict:Dictionary = taskArray[indexPath.row]

        //with strucs:
        //let thisTask = baseArray[indexPath.section][indexPath.row]
        let thisTask = fetchedResultsControler.objectAtIndexPath(indexPath) as TaskModel
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        //println(indexPath.row)
        
        //with dictionaries:
//        cell.taskLabel.text = taskDict["task"]
//        cell.descriptionLabel.text = taskDict["subtask"]
//        cell.dateLabel.text = taskDict["date"]
        
        //with strucs
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    
        //Define de height of the header
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
        //Define the text inside the header sections
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To do"
        }
        else {
            return "Completed"
        }
    }
    
        //Addin swype to the tableview
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //let thisTask:TaskModel = baseArray[indexPath.section][indexPath.row]
        let thisTask:TaskModel = fetchedResultsControler.objectAtIndexPath(indexPath) as TaskModel
        
        if indexPath.section == 0 {
//            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date
//                , completed: true)
//            baseArray[1].append(newTask)
            thisTask.completed = true
            
        }
        else {
//            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: false)
//            baseArray[0].append(newTask)
            thisTask.completed = false
        }
        
//        baseArray[indexPath.section].removeAtIndex(indexPath.row)
//        tableView.reloadData()
        (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
    }
    
    //NSFetchedResultControllerDelegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    //Helper
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName:"TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultsController() -> NSFetchedResultsController {
        fetchedResultsControler = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        return fetchedResultsControler
    }


}

