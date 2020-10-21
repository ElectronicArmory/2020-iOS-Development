//
//  BookmarksViewController.swift
//  WebBrowser
//
//  Created by Mike Z on 10/20/20.
//

import UIKit

class BookmarksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BookmarksController.bookmarkArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell")!

        let bookmarkString = BookmarksController.bookmarkArray[indexPath.row]
        cell.textLabel?.text = bookmarkString
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookmark = BookmarksController.bookmarkArray[indexPath.row]

        NotificationCenter.default.post(name: NSNotification.Name("bookmark"), object: bookmark)
         dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
