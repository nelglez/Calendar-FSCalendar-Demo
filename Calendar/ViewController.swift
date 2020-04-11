//
//  ViewController.swift
//  Calendar
//
//  Created by Nelson Gonzalez on 4/11/20.
//  Copyright © 2020 Nelson Gonzalez. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {
    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendar.delegate = self
        calendar.dataSource = self
        //calendar.scope = .week
        calendar.allowsMultipleSelection = false
        calendar.scope = .month
        calendar.firstWeekday = 2 //Start week on monday
        
    }

    func CheckSatSunday(today: Date) ->Bool{

        var DayExist: Bool
        //let today = NSDate()

        let calendar =
            NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        let components = calendar!.components([.weekday], from: today)

        if components.weekday == 1 {
            print("Sunday")
            DayExist = false
        } else if components.weekday == 7{
            print("Saturday")

            DayExist = false
        } else{
            print("It's not Saturday and  Sunday ")
            DayExist = true
        }
        print("weekday :\(String(describing: components.weekday)) ")
        return DayExist
    }
    

}

extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    // FSCalendarDelegate
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY at h:mm a"
        let string = formatter.string(from: date)
        print("\(string)")
        
       /*How to show the events data in FSCalander according to particular date and days range?
        var currentselected = ""
        let selectedDates = calendar.selectedDates.map({formatter.string(from: $0)})
        print("selected dates is \(selectedDates)")
        currentselected = "\(formatter.string(from: date))"
        callApiWillGiveresultbasedonselectedDate(currentselectedDate: currentselected)
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
        */
    }
    //Cant select weekends
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        //disable past dates.
        if date.compare(Date()) == .orderedAscending {
            return false
        }
        else {
            return true
        }
        
      //  return CheckSatSunday(today: date)
    }
    
    // FSCalendarDataSource
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
        return "Hi"
        
    }
   
    // FSCalendarDataSource
    func calendar(calendar: FSCalendar!, hasEventForDate date: Date!) -> Bool {
        return true
    }
    
    
    
    // FSCalendarDataSource

//
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        <#code#>
//    }
}
