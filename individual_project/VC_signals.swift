//
//  VC_signals.swift
//  individual_project
//
//  Created by Alexan Gomez on 10/31/17.
//  Copyright © 2017 Alexan Gomez. All rights reserved.
//

import UIKit
import CoreData

class VC_signals: UIViewController {

    //Initiators
    @IBOutlet weak var temperatureDisplay: UILabel!
    @IBOutlet weak var heartRateDisplay: UILabel!
    
    @IBAction func saveData(_ sender: Any) {
        // Storing into coredata
        // acess to apDelegate where core data is located
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext // allow interact with coredata
        let newBioData = NSEntityDescription.insertNewObject(forEntityName: "MyBioData", into: context) //Allow saving 
        // set up context with data
        newBioData.setValue(signals.bodyTemperature, forKey: "temperature")
        newBioData.setValue(signals.heartBeat, forKey: "heartRate")
        let time = Date()
        print(time)
        newBioData.setValue(time, forKey: "time")
        do
        {
            try context.save()
            print("Data saved")
        }
        catch
        {
            print("There is an error")//Process error
        }
    }
    
    
    @IBAction func checkSavedData(_ sender: Any) {
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
                    if let temperature = result.value(forKey: "temperature") as? Double
                    {
                        print(temperature)
                    }
                    if let heartRate = result.value(forKey: "heartRate") as? Double
                    {
                        print(heartRate)
                    }
                    if let time = result.value(forKey: "time") as? Double
                    {
                        print(time)
                    }
                }
            }
        }
        catch
        {
            print("there is an error")//Response error
        }
    }
    
    var signals = Signals(temperatureValue: 0.0, heartBeatValue: 0) // initiate object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signals.randomTemperature()
        signals.randomHeartRate()
        temperatureDisplay.text = String(signals.bodyTemperature)
        heartRateDisplay.text = String(signals.heartBeat)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
