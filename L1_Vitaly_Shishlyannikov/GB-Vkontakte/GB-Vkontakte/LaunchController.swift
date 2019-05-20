//
//  LaunchController.swift
//  GB-Vkontakte
//
//  Created by Vitalik on 17.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
   
    @IBOutlet weak var labelVK: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // кнопка запускает функцию проверки логина и пароля
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        // текст логина
        let login = userNameTextField.text
        // текст пароля
        let password = passwordTextField.text
        
        // проверка введенных данных
        if login == "admin" && password == "qwerty" {
            print("Успешная авторизация")
        } else {
            print("Неверный логин или пароль")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        //присваиваем его scrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // подписываемся на уведомление при появление клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // уведомление при пропадании клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // после появления клавиатуры
    @objc func keyboardWasShown(notification: Notification) {
        
        // получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey:
            UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // добавляем отступ внизу UIScrollView,  равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // после исчезновения клавиатуры
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        // устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // исчезновение клавиатуры при клике по месту на экране
    @objc func hideKeyBoard() {
        self.scrollView?.endEditing(true)
    }
    
    // метод для перехода на предыдущий экран
    @IBAction func myUNwindAction(unwindSegue: UIStoryboardSegue){}
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
