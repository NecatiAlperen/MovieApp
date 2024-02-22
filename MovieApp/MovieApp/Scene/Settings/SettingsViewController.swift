//
//  SettingsViewController.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 21.02.2024.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    
    let signOutButton: UIButton = {
        let signOutButton = UIButton(type: .system)
        signOutButton.backgroundColor = .systemBlue
        signOutButton.layer.cornerRadius = 15
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.white, for: .normal)
        return signOutButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)

    }
    
    
    private func configureUI(){
        
            view.addSubview(signOutButton)
            signOutButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-120)
                make.width.equalTo(self.view.snp.width).multipliedBy(0.9)
                make.height.equalTo(self.view.snp.height).multipliedBy(0.05)
            }
    }
    
    
    @objc func signOut() {
        do {
            try Auth.auth().signOut()
            modalPresentationStyle = .fullScreen
            present(LoginViewController(), animated: true)
            
            
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    

}
