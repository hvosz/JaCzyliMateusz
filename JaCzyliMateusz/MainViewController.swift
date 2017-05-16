//
//  MainViewController.swift
//  JaCzyliMateusz
//
//  Created by Mateusz on 06.05.2017.
//  Copyright © 2017 Mateusz. All rights reserved.
//

import UIKit
import AudioToolbox

class MainViewController: UIViewController {
//-------OUTLETS----------
    @IBOutlet weak var movingCircle: UIImageView!
    @IBOutlet weak var greenCircle: UIImageView!
    @IBOutlet weak var eyes: UIImageView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var Face: UIImageView!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var heartOne: UIImageView!
    @IBOutlet weak var heartTwo: UIImageView!
    @IBOutlet weak var heartThree: UIImageView!
    @IBOutlet weak var infoLable: UILabel!
    @IBOutlet weak var textSecondView: UILabel!
    
//---------VARS-----------

var hp = 3
var pointsNumber = 0
var oneWasActive = false
var twoWasActive = false
var threeWasActive = false
var fourWasActive = false
var fiveWasActive = false
var sixWasActive = false
var sevenWasActive = false
var eightWasActive = false
var nineWasActive = false
var tenWasActive = false
var elevenWasActive = false

    
    @IBAction func movingCircleEnabled(_ sender: UITapGestureRecognizer) {
        infoLable.text = "Last,after all ..."
        movingCircle.isUserInteractionEnabled = true
    }
    
    @IBAction func touchMovingCircle(_ sender: UIPanGestureRecognizer) {
        
        let minXOfGreenCircle = Int(greenCircle.frame.minX)
        let midXOfGreenCircle = Int(greenCircle.frame.midX)
        
        let midYOfGreenCircle = Int(greenCircle.frame.midY)
        
        let radius = midXOfGreenCircle - minXOfGreenCircle - 5
        
        let midXOfMovingCircle = Int(movingCircle.frame.midX)
        let midYOfMovingCircle = Int(movingCircle.frame.midY)
        
        let distanceMovingCircleToMidOfGreenCircle = Int(sqrt(Double(((midXOfGreenCircle - midXOfMovingCircle) * (midXOfGreenCircle - midXOfMovingCircle)) + ((midYOfGreenCircle - midYOfMovingCircle) * (midYOfGreenCircle - midYOfMovingCircle)))))
        
        if  distanceMovingCircleToMidOfGreenCircle > (radius - 10) && distanceMovingCircleToMidOfGreenCircle < (radius + 4)
        {
        
        let translation = sender.translation(in: self.view)
        
        if let view = sender.view{
            view.center = CGPoint(x:view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        let point = CGPoint(x: 0, y:0)
        
        sender.setTranslation(point, in: self.view)
            
        let xValue = Int(movingCircle.frame.midX) - Int(greenCircle.frame.midX)
        let yValue = Int(movingCircle.frame.midY) - Int(greenCircle.frame.midY)
            
        print("x:\(xValue), y: \(yValue)")
            
        showThatMoment(x: xValue, y: yValue)
        eyesSetting(x: xValue, y: yValue)
            
        }
        else
        {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            
            infoLable.text! = "Tap anywhere to unfroze circle"
            movingCircle.isUserInteractionEnabled = false
           //hp count
            
            hp -= 1
            
            switch hp {
            case 2:
                heartOne.isHidden = true
                 showLoseAlert("Graj dalej")
            case 1:
                heartTwo.isHidden = true
                 showLoseAlert("Graj dalej")
            case 0:
                heartThree.isHidden = true
                reset()
                showLoseAlert("Zacznij od nowa")
            default: break
            }
            
            
            
           // Head Animation
            UIView.animate(withDuration: 1.0, animations: {
                
                self.Face.transform = self.Face.transform.rotated(by: CGFloat(Double.pi))
                self.Face.transform = self.Face.transform.rotated(by: CGFloat(Double.pi))
                
                self.eyes.transform = self.eyes.transform.rotated(by: CGFloat(Double.pi))
                self.eyes.transform = self.eyes.transform.rotated(by: CGFloat(Double.pi))
            })
           
            //set moving circle
            movingCircle.center = CGPoint(x: greenCircle.frame.midX, y: greenCircle.frame.minY + 6)
            
            return
        }
    }
   
    func showLoseAlert(_ button:String)
    {
        let alert = UIAlertController(title: "Bad luck", message: "Przykro mi, przegrałeś. \(hp) Szanse/a", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: button, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentVC(_ numberOfPhoto:Int)
    {
        guard let vc = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "Moments") as? MomentsViewController else {
            return
        }
        vc.test = numberOfPhoto
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func addSubview(_ x:Int,_ y:Int){
        
        let imageName = "check.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.tag = pointsNumber + 1000
       
        imageView.frame = CGRect(x: x, y: y, width: 30, height: 30)
        view.addSubview(imageView)
    }
   
    func pointCount(){
        pointsNumber += 1
        points.text! = "\(pointsNumber)/11"
    }
    
    func showThatMoment(x:Int,y:Int){
        
        let circleX = Int(movingCircle.frame.origin.x)
        let circleY = Int(movingCircle.frame.origin.y)
        
        
        if ((x > 84 && x < 94) && (y > -130 && y < -120)) && oneWasActive == false {
            //USG - 1
            pointCount()
            addSubview(circleX, circleY)
            oneWasActive = true
            presentVC(1)
        }
        else if ((x > 131 && x < 141) && (y > -76 && y < -66)) && twoWasActive == false {
            //DZIEKO ROWER - 2
            pointCount()
            addSubview(circleX, circleY)
            twoWasActive = true
            presentVC(2)
            
        }
        else if ((x > 145 && x < 165) && (y > 0 && y < 8)) && threeWasActive == false {
            //Czytanie - 3
            pointCount()
            addSubview(circleX, circleY)
            threeWasActive = true
            presentVC(3)
            
        }
        else if ((x > 115 && x < 125) && (y > 90 && y < 95)) && fourWasActive == false {
            //Matura - 4
            pointCount()
            addSubview(circleX, circleY)
            fourWasActive = true
            presentVC(4)
          
        }
        else if ((x > 55 && x < 65) && (y > 131 && y < 141)) && fiveWasActive == false {
            //18 lat - 5
            pointCount()
            addSubview(circleX, circleY)
            fiveWasActive = true
            presentVC(5)
           
        }
        else if ((x > -2 && x < 2) && (y > 146 && y < 156)) && sixWasActive == false {
            //Dzisiaj - 6
            pointCount()
            addSubview(circleX, circleY)
            sixWasActive = true
            presentVC(6)
            
        }
        else if ((x > -72 && x < -62) && (y > 131 && y < 141)) && sevenWasActive == false {
            //Staż - 7
            pointCount()
            addSubview(circleX, circleY)
            sevenWasActive = true
            presentVC(7)
           
        }
        else if ((x > -124 && x < -114) && (y > 90 && y < 100)) && eightWasActive == false {
            //Czekaie na list - 8
            pointCount()
            addSubview(circleX, circleY)
            eightWasActive = true
            presentVC(8)
           
        }
        else if ((x > -156 && x < -146) && (y > 5 && y < 15)) && nineWasActive == false {
            //Biuro - 9
            pointCount()
            addSubview(circleX, circleY)
            nineWasActive = true
            presentVC(9)
            
        }
        else if ((x > -137 && x < -127) && (y > -80 && y < -70)) && tenWasActive == false {
            //Urna - 10
            pointCount()
            addSubview(circleX, circleY)
            tenWasActive = true
            presentVC(10)
            
        }
        else if ((x > -76 && x < -66) && (y > -137 && y < -127)) && elevenWasActive == false && pointsNumber == 10 {
            //Prawda - 11
            pointCount()
            addSubview(circleX, circleY)
            elevenWasActive = true
            presentVC(11)
            
        }
        else if ((x > -5 && x < 5) && (y > -160 && y < -150))  && pointsNumber == 11 {
            //Prawda - 11
            points.isHidden = true
            textSecondView.text = "Gratuluje to już koniec. Bardzo dziękuje za grę. Jeśli chcesz rozpocząć od nowa naciśnij przycisk poniżęj. Mail: mathej1@icloud.com"
            
            infoView.isHidden = false
            startButton.isHidden = false
            
            reset()
        }
        
    }
    
    func eyesSetting(x:Int,y:Int)
    {
        if y < 0{
            
            if x > 0
            {
                eyes.center = CGPoint(x: greenCircle.frame.midX + 8, y: greenCircle.frame.midY)
               
            }
            else{
                 eyes.center = CGPoint(x: greenCircle.frame.midX - 8, y: greenCircle.frame.midY)
            }
        }
        else
        {
            if x > 0
            {
                eyes.center = CGPoint(x: greenCircle.frame.midX + 8, y: greenCircle.frame.midY + 8)
            }
            else{
                eyes.center = CGPoint(x: greenCircle.frame.midX - 8, y: greenCircle.frame.midY + 8)
            }
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        
        heartOne.isHidden = false
        heartTwo.isHidden = false
        heartThree.isHidden = false
        points.isHidden = false
        infoView.isHidden = true
        startButton.isHidden = true
        movingCircle.isHidden = false
         movingCircle.center = CGPoint(x: greenCircle.frame.midX, y: greenCircle.frame.minY + 6)
        
    }
    
    func reset()
    {
        hp = 3
        pointsNumber = 0
        points.text = "\(pointsNumber)/11"
        oneWasActive = false
        twoWasActive = false
        threeWasActive = false
        fourWasActive = false
        fiveWasActive = false
        sixWasActive = false
        sevenWasActive = false
        eightWasActive = false
        nineWasActive = false
        tenWasActive = false
        elevenWasActive = false
        heartOne.isHidden = false
        heartTwo.isHidden = false
        heartThree.isHidden = false
        
        
        let subViews = self.view.subviews
        for subview in subViews{
            if subview.tag > 1000 {
                subview.removeFromSuperview()
            }
        }
    }
}


