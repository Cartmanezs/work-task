//
//  PictureViewController.swift
//  work task
//
//  Created by Ingvar on 6/9/19.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, URLSessionDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var showPictureButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var progressBarTimer: Timer!
    var isRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = "https://steamstore-a.akamaihd.net/public/shared/images/responsive/share_steam_logo.png" 
        
        progressView.progress = 0.0
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        
    }
    
    @IBAction func pressedShowButton(_ sender: Any) {
     
        
        if let text = textField.text, text != "" {
            if let url = URL(string: text )  {
                do{
                    let data = try Data(contentsOf: url)
                    
                    if(isRunning){
                        progressBarTimer.invalidate()
                        showPictureButton.setTitle("Завантажити", for: .normal)
                        
                    }
                    else{
                        showPictureButton.setTitle("Зупинити", for: .normal)
                        progressView.progress = 0.0
                        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(PictureViewController.updateProgressView), userInfo: nil, repeats: true)
                        self.imageView.image = .none
                        
                        progressView.progressTintColor = UIColor.blue
                        progressView.progressViewStyle = .default
                        
                    }
                    isRunning = !isRunning
                 

                }catch let error {
                    showAlert(with: error.localizedDescription)
                }
            }
        }else {
          showAlert(with: "Fill the text field")
        }
        
    }
    
    func showAlert(with text: String ){
        let alertController = UIAlertController(title: "Error", message: text, preferredStyle: UIAlertController.Style.alert)
        let confirmed = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(confirmed)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showThePicture(){
        if let text = textField.text, text != "" , let url = URL(string: text ){
            do{
                let data = try Data(contentsOf: url)
                let image = UIImage(data:  data)
                self.imageView.image = image
                
            }catch let error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateProgressView(){
        progressView.progress += 0.1
        progressView.setProgress(progressView.progress, animated: true)
        
        if(progressView.progress == 1.0)
        {
            showThePicture()
            progressBarTimer.invalidate()
            isRunning = false
            showPictureButton.setTitle("Завантажити", for: .normal)
        }
    }
}


