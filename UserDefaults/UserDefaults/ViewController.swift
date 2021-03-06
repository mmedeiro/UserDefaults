//
//  ViewController.swift
//  UserDefaults
//
//  Created by Mariana Medeiro on 08/07/15.
//  Copyright (c) 2015 Mariana Medeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobrenomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botaoAlterarImagem(sender: AnyObject) {
        
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        imageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func botaoSalvar(sender: AnyObject) {
        
        nomeTextField.resignFirstResponder()
        sobrenomeTextField.resignFirstResponder()
        idadeTextField.resignFirstResponder()
        
        var nome = String()
        var sobrenome = String()
        var idade = String()
        
        nome = nomeTextField.text
        sobrenome = sobrenomeTextField.text
        idade = idadeTextField.text
        
        var contactImage = UIImage()
        var imageData = NSData()
        
        contactImage = imageView.image!
        UIImageJPEGRepresentation(contactImage, 100)
        
        var defaults = NSUserDefaults()
        
        defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nome, forKey: "nome")
        defaults.setObject(sobrenome, forKey: "sobrenome")
        defaults.setObject(idade, forKey: "idade")
        defaults.setObject(imageData, forKey: "image")
        
        defaults.synchronize()
        
        println("Salvooooooou, uhuuuul")

    }
}

