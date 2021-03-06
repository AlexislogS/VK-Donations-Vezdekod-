//
//  PostingViewController.swift
//  VK Donations (Vezdekod)
//
//  Created by Alex Yatsenko on 12.09.2020.
//  Copyright © 2020 AlexislogS. All rights reserved.
//

import UIKit

final class PostingViewController: UIViewController {
    
    @IBOutlet weak var donationImageView: UIImageView!
    @IBOutlet weak var donationTitleLabel: UILabel!
    @IBOutlet weak var donationTextView: UITextView! {
        didSet {
            donationTextView.becomeFirstResponder()
        }
    }
    
    var donation: Donation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        donationTitleLabel.text = donation?.title
        if let imageData = donation?.image {
            donationImageView.image = UIImage(data: imageData)
        }
    }
    
    @IBAction func postButtonPressed(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(donationTextView.text, forKey: donation!.title!)
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}
