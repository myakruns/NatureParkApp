//
//  BirdDetailViewController.swift
//  CNPGuide
//
//  Created by Mike Yakubovsky on 10/6/18.
//  Copyright © 2018 Mike Yakubovsky. All rights reserved.
//

import UIKit
import os.log

class BirdDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: -  Properties
    @IBOutlet weak var birdDetailImage: UIImageView!
    @IBOutlet weak var birdDetailDescription: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var birdNameTextField: UITextField!
    @IBOutlet weak var birdSightedLabel: UILabel!
    
    var bird: Bird?
    var sightingStatus = false
    var birdEditingName = "New"
    var birdEditingDescription = "No description given"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        birdNameTextField.delegate = self
        
        if let bird = bird {
            navigationItem.title = bird.birdName
            birdEditingName = bird.birdName
            birdDetailImage.image = bird.mainPhoto
            birdDetailDescription.text = bird.birdDescription
            birdEditingDescription = bird.birdDescription ?? "no description given"
            sightingStatus = bird.sighted
        }
        
        updateSightingStatus()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.title = textField.text
        birdEditingName = textField.text ?? "New Bird"
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        birdDetailImage.image = selectedImage
        dismiss(animated: true,
                completion: nil)
    }
    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddBirdMode = presentingViewController is UINavigationController
        
        if isPresentingInAddBirdMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The BirdViewController is not inside a navigation controller")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        //let name = self.title ?? ""
        let name = birdEditingName
        let photo = birdDetailImage.image
        let birdDescription = birdEditingDescription
        let sighted = sightingStatus
        
        bird = Bird(birdName: name, birdDescription: birdDescription, sighted: sighted, mainPhoto: photo)
    }
    
    // MARK: - Editing Actions
    
    @IBAction func changeBirdSightedStatusActionSheet() {
        let birdSightedAlertController = UIAlertController(title: "Did you see this bird?", message: nil, preferredStyle: .actionSheet)
        birdSightedAlertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.sightingStatus = true
            self.updateSightingStatus()
        }))
        birdSightedAlertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            self.sightingStatus = false
            self.updateSightingStatus()
        }))
        
        self.present(birdSightedAlertController, animated: true)
    }
    
    /*
    @IBAction func showNameAlert() {
        let birdNamealertController = UIAlertController(title: "Bird Name",
                                                message: nil,
                                                preferredStyle: .alert)
        birdNamealertController.addAction(UIAlertAction(title: "Cancel",
                                                        style: .cancel,
                                                        handler: nil))
        
        birdNamealertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input bird name here"
        })
        
        birdNamealertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let name = birdNamealertController.textFields?.first?.text {
                self.title = name
            }
        }))
        
        self.present(birdNamealertController,
                     animated: true)
    }
    */
    @IBAction func changeBirdSightedStatus(_ sender: UITapGestureRecognizer) {
        changeBirdSightedStatusActionSheet()
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func showDescriptionAlert() {
        let birdDescriptionAlertController = UIAlertController(title: "Update Description", message: nil, preferredStyle: .alert)
        birdDescriptionAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        birdDescriptionAlertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input description here"
        })
        birdDescriptionAlertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let newBirdDescription = birdDescriptionAlertController.textFields?.first?.text {
                self.birdDetailDescription.text = newBirdDescription
                self.birdEditingDescription = newBirdDescription
            }
        }))
        self.present(birdDescriptionAlertController, animated: true)
    }
    
    @IBAction func changeBirdDescription(_ sender: Any) {
        showDescriptionAlert()
    }
    
    func updateSightingStatus() {
        if sightingStatus {
            birdSightedLabel.textColor = .white
            birdSightedLabel.text = "Sighted"
            sightingStatus = true
        } else {
            birdSightedLabel.textColor = .gray
            birdSightedLabel.text = "Not sighted yet"
            sightingStatus = false
        }
    }
    
}
