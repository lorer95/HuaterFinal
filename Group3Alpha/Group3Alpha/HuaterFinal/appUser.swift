//
//  appUser.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import Foundation


//
//  User.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import Foundation

class appUser {
    
    var _fName: String = ""
    var _lName: String = ""
    var _email: String = ""
    var _gender: String = ""
    var _age: Int = 0
    var _weight: Int = 0
    var _metric: String = ""
    var _pswd: String = ""
    var _theme: String = ""
    var _idNO: Int = 0
    
    var fName:String {
        get { return _fName }
        set (value) { _fName = value }
    }
    
    var lName:String {
        get { return _lName }
        set (value) { _lName = value }
    }
    
    var gender:String {
        get { return _gender }
        set (value) { _gender = value }
    }
    
    var age:Int {
        get { return _age }
        set (value) { _age = value }
    }
    
    var weight:Int {
        get { return _weight }
        set (value) { _weight = value }
    }
    
    var email:String {
        get { return _email }
        set (value) { _email = value }
    }
    
    var metric:String {
        get { return _metric }
        set (value) { _metric = value }
    }
    
    var pswd:String {
        get { return _pswd }
        set (value) { _pswd = value }
    }
    
    var theme:String {
        get { return _theme }
        set (value) { _theme = value }
    }
    
    var idNO:Int {
        get {return _idNO}
        set (value) {_idNO = value}
    }
    
    
    
    init( idNO: Int, stringInfo: [String], numInfo: [Int]) {
        
        self._idNO = idNO
        
        self._fName = stringInfo[0]
        self._lName = stringInfo[1]
        self._email = stringInfo[2]
        self._pswd = stringInfo[3]
        self._gender = stringInfo[4]
        self._metric = stringInfo[5]
        self._theme = stringInfo[6]
        
        self._age = numInfo[0]
        self._weight = numInfo[1]
   
        
    }
    
}


