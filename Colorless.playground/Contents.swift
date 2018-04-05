/*:
# Color Blindness

Color blindness is a condition that affects 8% of males and 0.5% of females. People suffering from this condition have the decreased ability to see color or differences in color. Color blindness is a condition without cure and can make some activities difficult.

The types of color blindness and their respective incidence in the general population are as follow:

![color graph](IMG_0087.PNG)

Color blindness usually is an inherited condition, but it can also be acquired as a cause of diseases, drugs and exposure to chemicals.

The goal of this playground is to bring awareness to color blindness by showing how someone with this condition sees the world.

*/

//import libraries:
import PlaygroundSupport
import UIKit
import CoreImage
import AVFoundation

//global variables:
var visions : [String] = [
    "Normal Vision",
    "Deuteranomaly",
    "Protanomaly",
    "Protanopia",
    "Deuteranopia",
    "Tritanopia",
    "Tritanomaly",
    "Achromatopsia"
]
var mainImage = UIImageView()
var filterScrollView = UIScrollView()
let descriptionLabel = UILabel()

//introduction view class:
class IntroModalViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        //create view:
        let newView = UIView()
        newView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        //create 1st label:
        let label = UILabel()
        label.text = "Touch the camera \nto take a picture \nand use it."
        label.numberOfLines = 3
        label.textAlignment = NSTextAlignment.center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        newView.addSubview(label)
        //create 2nd label:
        let label2 = UILabel()
        label2.text = "Touch '+' to \nchoose a picture from \nthe Photo Library."
        label2.numberOfLines = 3
        label2.textAlignment = NSTextAlignment.center
        label2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        newView.addSubview(label2)
        //create 3rd label:
        let label3 = UILabel()
        label3.text = "Touch 'Save' to \nsave the current picture \nin the Photo Library."
        label3.numberOfLines = 3
        label3.textAlignment = NSTextAlignment.center
        label3.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        newView.addSubview(label3)
        //create 1st arrow:
        let arrow1 = UIImageView()
        arrow1.image = #imageLiteral(resourceName: "IMG_0091.PNG")
        arrow1.contentMode = UIViewContentMode.scaleAspectFit
        newView.addSubview(arrow1)
        //create 2nd arrow:
        let arrow2 = UIImageView()
        arrow2.image = #imageLiteral(resourceName: "IMG_0092.PNG")
        arrow2.contentMode = UIViewContentMode.scaleAspectFit
        newView.addSubview(arrow2)
        //create 3rd arrow:
        let arrow3 = UIImageView()
        arrow3.image = #imageLiteral(resourceName: "IMG_0092.PNG")
        arrow3.contentMode = UIViewContentMode.scaleAspectFit
        newView.addSubview(arrow3)
        //create done button:
        let button = UIButton(type: .system)
        button.setTitle("Touch anywhere to continue", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
        button.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.backgroundColor = UIColor(white: 0, alpha: 0)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.layer.cornerRadius = 3
        newView.addSubview(button)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        arrow1.translatesAutoresizingMaskIntoConstraints = false
        arrow2.translatesAutoresizingMaskIntoConstraints = false
        arrow3.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(newView)
        
        NSLayoutConstraint.activate([
            newView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            newView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            newView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            newView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            
            label.topAnchor.constraint(equalTo: arrow1.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            label.heightAnchor.constraint(equalToConstant: 65),
            label.widthAnchor.constraint(equalToConstant: 200),
            
            label2.topAnchor.constraint(equalTo: arrow2.bottomAnchor),
            label2.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            label2.heightAnchor.constraint(equalToConstant: 65),
            label2.widthAnchor.constraint(equalToConstant: 200),
            
            label3.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            label3.bottomAnchor.constraint(equalTo: newView.bottomAnchor),
            label3.heightAnchor.constraint(equalToConstant: 100),
            label3.widthAnchor.constraint(equalTo: newView.widthAnchor, multiplier: 0.45),
            
            arrow1.topAnchor.constraint(equalTo: newView.topAnchor, constant: 20),
            arrow1.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            arrow1.heightAnchor.constraint(equalToConstant: 50),
            arrow1.widthAnchor.constraint(equalToConstant: 150),
            
            arrow2.topAnchor.constraint(equalTo: newView.topAnchor, constant: 20),
            arrow2.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            arrow2.heightAnchor.constraint(equalToConstant: 50),
            arrow2.widthAnchor.constraint(equalToConstant: 150),
            
            arrow3.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            arrow3.bottomAnchor.constraint(equalTo: label3.topAnchor, constant: 15),
            arrow3.heightAnchor.constraint(equalToConstant: 50),
            arrow3.widthAnchor.constraint(equalTo: newView.widthAnchor, multiplier: 0.45),
            
            button.topAnchor.constraint(equalTo: newView.topAnchor),
            button.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: newView.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: newView.trailingAnchor)
            ])
    }
    
    @objc public func dismissView() {
        
        // Comando para remover a janela modal da tela
        self.dismiss(animated: true, completion:nil)
    }
}
//main view class:
class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //initialize picker:
    let picker = UIImagePickerController()
    
    //global variables:
    var procLabel = UILabel()   
    var visionButtons: [UIButton] = []
    var saveButton = UIButton()
    
    override func loadView() {
        super.loadView()
            //setup items on the screen:
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pickPhoto))
        rightButton.tintColor = #colorLiteral(red: 0.176470592617989, green: 0.498039215803146, blue: 0.756862759590149, alpha: 1.0)
        let leftButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(takePhoto))
        leftButton.tintColor = #colorLiteral(red: 0.176470592617989, green: 0.498039215803146, blue: 0.756862759590149, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        saveButton.setTitleColor(#colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), for: .selected)
        saveButton.backgroundColor = UIColor(white: 0, alpha: 0.5)
        saveButton.addTarget(self, action: #selector(savePhoto), for: UIControlEvents.touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        procLabel.text = "Processing..."
        procLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        procLabel.textAlignment = NSTextAlignment.center
        procLabel.backgroundColor = UIColor(white: 0, alpha: 0.5)
        procLabel.translatesAutoresizingMaskIntoConstraints = false
        
        picker.delegate = self
        view.backgroundColor = .white
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = UIViewContentMode.scaleAspectFit
        filterScrollView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        descriptionLabel.textAlignment = NSTextAlignment.center
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 25)
        descriptionLabel.textColor = .white
        
        view.addSubview(mainImage)
        view.addSubview(filterScrollView)
        view.addSubview(descriptionLabel)
        view.addSubview(saveButton)
        view.addSubview(procLabel)
        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            
            filterScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            filterScrollView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            filterScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            procLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            procLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            procLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            procLabel.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: filterScrollView.topAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            descriptionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            saveButton.bottomAnchor.constraint(equalTo: filterScrollView.topAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            saveButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08)
            ])
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colorless"
        procLabel.isHidden = true
        saveButton.isEnabled = false
        //load introduction modal view:
        let introVC = IntroModalViewController()
        introVC.modalPresentationStyle = .overCurrentContext
        introVC.modalTransitionStyle = .crossDissolve
        self.present(introVC, animated: true)
    }
    //function that creates filters:
    func loadFilters(inputImage: CIImage, visionType: String) -> CIImage {
        //create filters parameters:
        let deuteranopia : [String:AnyObject] = [
            "inputRedCoefficients":CIVector(string: "[0 1 0 0.01 0.5 0 1 0 0 0]"),
            "inputGreenCoefficients":CIVector(string: "[0 1 0 0 0 0.15 0 0 0 0]"),
            "inputBlueCoefficients":CIVector(string: "[0 0 0.7 0 0.2 0 0 0 0 0]")
        ]
        let deuteranomaly : [String:AnyObject] = [
            "inputRedCoefficients":CIVector(string: "[0.3 0.5 0 0 0 0 1 0 0 0]"),
            "inputGreenCoefficients":CIVector(string: "[0 1 0 0 0 0 0 0 0 0]"),
            "inputBlueCoefficients":CIVector(string: "[0 0 1 0 0.1 0 0 0 0 0]")
        ]
        let protanopia : [String:AnyObject] = [
            "inputRedCoefficients":CIVector(string: "[0 0 0 0 1 0 1 0 0 0]"),
            "inputGreenCoefficients":CIVector(string: "[0 1 0 0 0 0.1 0 0 0 0]"),
            "inputBlueCoefficients":CIVector(string: "[0 0 1 0 0.1 0 0 0 0 0]")
        ]
        let protanomaly : [String:AnyObject] = [
            "inputRedCoefficients":CIVector(string: "[0 0.5 0 0.08 0 0 3 0 0 0]"),
            "inputGreenCoefficients":CIVector(string: "[0 1 0 0 0 0 0 0 0 0]"),
            "inputBlueCoefficients":CIVector(string: "[0 0 1 0 0 0 0 0 0 0]")
        ]
        let tritanopia : [String:AnyObject] = [
            "inputRedCoefficients":CIVector(string: "[1 0 0 0.1 0 0 0 0 0 0]"),
            "inputGreenCoefficients":CIVector(string: "[0 1 0 0 0 0.1 0 0 0 0]"),
            "inputBlueCoefficients":CIVector(string: "[0.05 0 0.2 0.05 0.9 0 0 0 0 0]")
        ]
        let tritanomaly : [String:AnyObject] = [
            "inputRedCoefficients":CIVector(string: "[3 0 0 0 0 0 0 0 0 0]"),
            "inputGreenCoefficients":CIVector(string: "[0 1 0 0 0 0 0 0 0 0]"),
            "inputBlueCoefficients":CIVector(string: "[0 0 1 0 0.35 0 0 0 0 0]")
        ]
        
        //load filters based on condition:
        if (visionType == "Normal Vision"){
            return inputImage
        }
        else if (visionType == "Achromatopsia"){
            let filter = CIFilter(name: "CIPhotoEffectMono")!
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            return filter.outputImage!
        }
        else {
            let filter = CIFilter(name: "CIColorCrossPolynomial")!
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            if (visionType == "Deuteranopia"){
                filter.setValuesForKeys(deuteranopia)
            }
            else if (visionType == "Deuteranomaly"){
                filter.setValuesForKeys(deuteranomaly)
            }
            else if (visionType == "Protanopia"){
                filter.setValuesForKeys(protanopia)
            }
            else if (visionType == "Protanomaly"){
                filter.setValuesForKeys(protanomaly)
            }
            else if (visionType == "Tritanopia"){
                filter.setValuesForKeys(tritanopia)
            }
            else if (visionType == "Tritanomaly"){
                filter.setValuesForKeys(tritanomaly)
            }
            return filter.outputImage!
        }
    }
    //function to disable buttons border:
    func disableBorders () {
        for i in 0..<visionButtons.count {
            visionButtons[i].layer.borderWidth = 0
        }
    } 
    //function to resize the chosen image:
    func resizeImage (image: UIImage, scale: CGFloat) -> UIImage {
        let size = CGSize(width: image.size.width*scale, height: image.size.height*scale)
        UIGraphicsBeginImageContext(size)
        let point = CGPoint(x: 0, y: 0)
        image.draw(in: CGRect(origin: point, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
    //function that process the image and generates one image for each filter:
    func processImages(){
        //variables:
        var x: CGFloat = 5
        var y: CGFloat = 5
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 100
        let buttonPadding: CGFloat = 5
        //remove previous buttons from screen and array:
        for view in filterScrollView.subviews {
            view.removeFromSuperview()
        }
        visionButtons.removeAll()
        //loop to create buttons and filters:
        for i in 0..<visions.count {
            //create filter buttons:
            let button = UIButton()
            button.tag = i
            button.layer.cornerRadius = 6
            button.layer.borderWidth = 0
            button.layer.borderColor = #colorLiteral(red: 0.254901975393295, green: 0.274509817361832, blue: 0.301960796117783, alpha: 1.0)
            button.addTarget(self, action: #selector(visionButtonTapped), for: .touchUpInside)
            button.clipsToBounds = true
            button.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
            visionButtons.append(button)
            //generate images from filters:
            let context = CIContext(options: nil)
            let inputImage = CIImage(image: mainImage.image!)
            let imageOrientation : UIImageOrientation = (mainImage.image?.imageOrientation)! 
            let imageScale = mainImage.image?.scale
            let filterOutputImage = loadFilters(inputImage: inputImage!, visionType: visions[i])
            let convertedOutputImage = context.createCGImage(filterOutputImage, from: (filterOutputImage.extent))
            let processedImage = UIImage(cgImage: convertedOutputImage!, scale: imageScale!, orientation: imageOrientation)
            //assign images to buttons:
            let buttonImage = processedImage
            visionButtons[i].setImage(buttonImage, for: .normal)
            visionButtons[i].imageView?.contentMode = UIViewContentMode.scaleAspectFit
            visionButtons[i].setTitle(visions[i], for: .disabled)
            //Add Buttons to the scrollView:
            x += buttonWidth + buttonPadding
            filterScrollView.addSubview(visionButtons[i])
            procLabel.isHidden = true
            saveButton.isEnabled = true
        }
        //adjust scrollView parameters:
        filterScrollView.contentSize = CGSize(width: x , height: y)
        filterScrollView.alwaysBounceHorizontal = true
        visionButtons[0].layer.borderWidth = 2
    }
    //function to load the choosen image:
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        var chosenImageScaled = UIImage()
        if (chosenImage.size.width > 2000 || chosenImage.size.height > 2000){
            chosenImageScaled = resizeImage(image: chosenImage, scale: 0.4)
        } else {
            chosenImageScaled = chosenImage
        }
        mainImage.image = chosenImageScaled
        procLabel.isHidden = false
        descriptionLabel.text = "Normal Vision"
        DispatchQueue.main.async {
            self.processImages()
        }
        dismiss(animated:true, completion: nil)
    }
    //function to choose pictures from the Photo Library:
    @IBAction func pickPhoto(sender:UIBarButtonItem) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    //function to choose pictures from the Camera:
    @IBAction func takePhoto(_ sender: UIBarButtonItem){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    //function that calls an Alert if the device has no Camera:
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present( alertVC, animated: true, completion: nil)
    }
    //function to cancel the picker:
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //function that changes the displayed image:
    @IBAction func visionButtonTapped(sender: UIButton){
        disableBorders()
        visionButtons[sender.tag].layer.borderWidth = 2
        mainImage.image = sender.image(for: .normal)
        descriptionLabel.text = sender.title(for: .disabled)
    }
    //function to save the processed picture:
    @IBAction func savePhoto(sender: UIButton){
        UIImageWriteToSavedPhotosAlbum(mainImage.image!, nil, nil, nil)
        let alertVC = UIAlertController(
            title: title, message: "Your image has been saved!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present( alertVC, animated: true, completion: nil)
    }
}
//liveview initialization:
PlaygroundPage.current.liveView = UINavigationController(rootViewController:MainViewController())

