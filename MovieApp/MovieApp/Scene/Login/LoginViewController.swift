//
//  ViewController.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 21.02.2024.
//

import UIKit
import SnapKit
import FirebaseAuth


class LoginViewController: UIViewController {

    // MARK: - Properties
    
    private let logoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-posta"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Şifre"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Giriş Yap", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Kaydol", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()
    private lazy var toggleButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "eye"), for: .normal)
            button.tintColor = .systemBlue
            button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            return button
        }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(view.snp.height).multipliedBy(1.0/15.0) // Ekranın 1/15'i kadar yükseklik
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(emailTextField)
            make.trailing.equalTo(emailTextField)
            make.height.equalTo(emailTextField)
        }
        
        view.addSubview(toggleButton)
        toggleButton.snp.makeConstraints { make in
                    make.centerY.equalTo(passwordTextField)
                    make.trailing.equalTo(passwordTextField).offset(-10)
                }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(passwordTextField)
            make.trailing.equalTo(passwordTextField)
            make.height.equalTo(emailTextField)
        }
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
    }
    
    // MARK: - Actions
    
    @objc private func loginButtonTapped() {
            
        if emailTextField.text != "" && passwordTextField.text  != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {(authdata,error) in
                
                if error != nil{
                    self.makeAlert(titleInput: "error", messageInput: error?.localizedDescription ?? "error")
                }else{
                    let home = MainTabBarController()
                    home.modalPresentationStyle = .fullScreen
                    self.present(home, animated: true,completion: nil)
                    
                }
            }
        }
    }
    
    
    @objc private func registerTapped(){
        let registerVC = RegisterViewController()
            present(registerVC, animated: true, completion: nil)
    }
    @objc private func togglePasswordVisibility(){
        passwordTextField.isSecureTextEntry.toggle() // Şifre görünürlüğünü tersine çevir
                let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.fill"
                toggleButton.setImage(UIImage(systemName: imageName), for: .normal)
        
    }
    
    func makeAlert(titleInput:String, messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
    }
}
