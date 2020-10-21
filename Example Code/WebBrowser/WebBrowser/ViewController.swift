//
//  ViewController.swift
//  WebBrowser
//
//  Created by Mike Z on 10/20/20.
//

import UIKit
import WebKit


class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!

    @IBOutlet weak var bookmarksButton: UIButton!

    @IBOutlet weak var urlTextField: UITextField!


    @IBOutlet weak var webView: WKWebView!


    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(bookmarkSelected(notification:)), name: NSNotification.Name?(NSNotification.Name(rawValue: "bookmark")), object: nil)
    }


    @objc
    func bookmarkSelected(notification:Notification) {
        let bookmarkURL = notification.object as! String
        webView.load(URLRequest(url: URL(string: bookmarkURL)!))
    }


    override func viewDidAppear(_ animated: Bool) {
        webView.load(URLRequest(url: URL(string: "https://www.apple.com")!))
    }


    @IBAction func goBackTapped(_ sender: Any) {
        if( webView.canGoBack){
            webView.goBack()
        }
    }

    @IBAction func goForwardTapped(_ sender: Any) {
        if( webView.canGoForward ){
            webView.goForward()
        }
    }

    @IBAction func addBookmarkTapped(_ sender: Any) {
        let currentURL = webView.url?.absoluteString

        BookmarksController.bookmarkArray.append(currentURL!)
    }
    @IBAction func openBookmarksTapped(_ sender: Any) {
        let bookmarksViewController = storyboard?.instantiateViewController(identifier: "BookmarksViewController")
        present(bookmarksViewController!, animated: true, completion: nil)
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = urlTextField.text
        let url = URL(string: urlString!)
        let urlRequest = URLRequest(url: url!)

        webView.load(urlRequest)

        textField.resignFirstResponder()

        return true
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        urlTextField.text = webView.url?.absoluteString
    }
}

