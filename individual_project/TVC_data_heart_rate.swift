//
//  TVC_data_heart_rate.swift
//  individual_project
//
//  Created by Alexan Gomez on 11/5/17.
//  Copyright © 2017 Alexan Gomez. All rights reserved.
//

import UIKit
import CoreData

class TVC_data_heart_rate: UITableViewController {

//    var temperatureData:[Double] = []
    var heartRateData:[Double] = []
   
    
    func getDataFromCoreData (){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MyBioData")
        request.returnsObjectsAsFaults = false
        do
        {
            let resuls = try context.fetch(request) // call the source
            if resuls.count > 0 {
                for result in resuls as! [NSManagedObject]
                {
                    
                    if let heartRate = result.value(forKey: "heartRate") as? Double
                    {
                        heartRateData.append(heartRate)
                    }
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromCoreData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heartRateData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHeartRate", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = String(heartRateData[indexPath.row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        
            // Delete the row from the data source
            heartRateData.remove(at: indexPath.row)
//
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
//
//            context.delete(heartRateData[indexPath.row] as! NSManagedObject)
//            heartRateData.remove(at: indexPath.row)
//            do
//            {
//              try context.save()
//            }
//            catch
//            {
//                print(error)
//            }
            
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)

            
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
