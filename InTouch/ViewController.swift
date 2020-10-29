//
//  ViewController.swift
//  InTouch
//
//  Created by Oleg Koptev on 29.10.2020.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var smsButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    
    @IBAction func sendEmail(_ sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("My Subject")
            mailVC.setToRecipients(["olegstankoptev@gmail.com"])
            mailVC.setMessageBody("<p>Hello!</p>", isHTML: true)
            mailVC.mailComposeDelegate = self
            
            self.present(mailVC, animated: true, completion: nil)
        } else {
            print("Your device doesn't support sending email")
        }
    }
    
    @IBAction func sendText(_ sender: AnyObject) {
        if (MFMessageComposeViewController.canSendText()) {
            let smsVC = MFMessageComposeViewController()
            smsVC.messageComposeDelegate = self
            smsVC.recipients = ["89852854008"]
            smsVC.body = "Please call me back"
            self.present(smsVC, animated: true, completion: nil)
        } else {
            print("Your device doesn't support sms messaging")
        }
    }
    
    @IBAction func openWebsite(_ sender: AnyObject) {
        UIApplication.shared.open(URL(string: "http://hse.ru")!, options: [:], completionHandler: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .sent:
            print("sent")
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        @unknown default:
            print("unknows result value")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .sent:
            print("sent")
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        @unknown default:
            print("unknown result value")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailButton.layer.cornerRadius = min(emailButton.frame.height, emailButton.frame.width) / 4;
        smsButton.layer.cornerRadius = min(smsButton.frame.height, smsButton.frame.width) / 4;
        websiteButton.layer.cornerRadius = min(websiteButton.frame.height, websiteButton.frame.width) / 4;
        
    }

}

