//
//  ViewController.swift
//  TaskIt
//
//  Created by Jesús on 23/11/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //with dictionaries:
    //var taskArray:[Dictionary<String,String>] = []
    var taskArray:[TaskModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //with dictionaries:
//        let task1:Dictionary<String,String> = ["task":"Study French", "subtask":"Verbs", "date":"01/14/2014"]
//        let task2:Dictionary<String,String> = ["task":"Eat Dinner", "subtask":"Burgers", "date":"01/14/2014"]
//        let task3:Dictionary<String,String> = ["task":"Gym", "subtask":"Leg day", "date":"01/14/2014"]
//        taskArray = [task1, task2, task3]
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        //with strucs:
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3)]
        
        self.tableView.reloadData()
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
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //with dictionaries:
        //let taskDict:Dictionary = taskArray[indexPath.row]

        //with strucs:
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        //println(indexPath.row)
        
        //with dictionaries:
//        cell.taskLabel.text = taskDict["task"]
//        cell.descriptionLabel.text = taskDict["subtask"]
//        cell.dateLabel.text = taskDict["date"]
        
        //with strucs
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    



}

