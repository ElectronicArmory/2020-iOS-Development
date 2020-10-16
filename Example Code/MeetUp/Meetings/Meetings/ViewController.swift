//
//  ViewController.swift
//  Meetings
//
//  Created by Mike Z on 10/15/20.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var results:[Meeting] = []

    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        return results.count

    }

    // TODO: Make sure this fires when the other VC is dismissed
    override func viewDidAppear(_ animated: Bool) {
        let fetchRequest:NSFetchRequest = Meeting.fetchRequest()

        do{
            results = try (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext.fetch(fetchRequest) as! [Meeting]
            tableView.reloadData()
        }
        catch{
            print("error!")
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingCell")

        let currentMeeting = results[indexPath.row]
        cell?.textLabel?.text = currentMeeting.topic

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func addMeetingTapped(_ sender: Any) {
        let meetingViewController = storyboard?.instantiateViewController(identifier: "MeetingViewController")
        present(meetingViewController!, animated: true, completion: nil)
    }
}

