//
//  SignUpPresenter.swift
//  FoodRecipeTask
//
//  Created by Hala on 12/05/2021.
//

import Firebase



protocol SignupView: class{
    func startAnimating()
    func stopAnimating()
    func showDescriptionAlert(description: String)
    
}


protocol SignupViewPresenter{
    
    init(view: SignupView)
    func emailPasswordSignup(userName: String?, email: String?, password: String?, isFinishCompletion: @escaping ((Bool) -> Void))
    
}

class SignupPresenter: SignupViewPresenter{

    let defaults = UserDefaults.standard
    weak var view: SignupView?
    
    
    required init(view: SignupView) {
        self.view = view
    }
    
    
    
    func saveUserDataToUserDefaults(userName: String, email: String){
            
        defaults.setValue(userName, forKey: K.UserDefaultsData.userName)
        defaults.setValue(email, forKey: K.UserDefaultsData.email)
        
    }
    

    
    // sign up using username, email and password
    func emailPasswordSignup(userName: String?, email: String?, password: String?, isFinishCompletion: @escaping ((Bool) -> Void)) {
        
        isFinishCompletion(false)
        view?.startAnimating()
        
        
        guard let email = email, let userName = userName, let password = password, email.isValidateEmail(), password.isValidatePassword() else{
            return
        }
        
 
        Auth.auth().createUser(withEmail: email, password: password) { [self] (authResult, error) in
            if let _ = authResult{

                // save user information as name, email, in UserDefaults
                saveUserDataToUserDefaults(userName: userName, email: email)

                self.view?.stopAnimating()
                isFinishCompletion(true)

            }else if let error = error{
                self.view?.showDescriptionAlert(description: error.localizedDescription)
                print(error.localizedDescription)
            }
        }

    }
}

        
