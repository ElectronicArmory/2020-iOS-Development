//
//  ViewController.swift
//  CameraMaps
//
//  Created by Mike Z on 10/1/20.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePickerController = UIImagePickerController()


    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
    }

    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "Choose a profile photo", message: "Choose from your library or camera to select a profile photo to use in your new account.", preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (alertAction) in
            print("library")
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alertAction) in
            print("camera")
            if( UIImagePickerController.isSourceTypeAvailable(.camera) ){
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            print("cancel")
        }))

        present(alertController, animated: true, completion: nil)
    }


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let choosenImage = info[.editedImage] as! UIImage

        imageView.image = choosenImage

        dismiss(animated: true, completion: nil)
    }

}

