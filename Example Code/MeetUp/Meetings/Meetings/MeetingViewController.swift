//
//  MeetingViewController.swift
//  Meetings
//
//  Created by Mike Z on 10/15/20.
//

import UIKit
import CoreData

class MeetingViewController: UIViewController {

    @IBOutlet weak var meetingTitle: UITextField!
    @IBOutlet weak var meetingDescription: UITextView!
    @IBOutlet weak var meetingHost: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        let newMeeting = Meeting(context: managedObjectContext!)
        newMeeting.topic = meetingTitle.text
        newMeeting.meetingDescription = meetingDescription.text
        newMeeting.host = meetingHost.text

        dismiss(animated: true) {
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
