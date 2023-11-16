//
//  AppEnvironment.swift
//  Assignment1
//
//  Created by Eytsam Elahi on 16/11/2023.
//

import Foundation

public enum AppEnvironment {

  // MARK: - Plist
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()

  // MARK: - Plist values
  static let baseURL: String = {
      guard let url = AppEnvironment.infoDictionary[Constants.BASE_URL] as? String else {
      fatalError("Base URL not set in plist for this environment")
    }
    return url
  }()
}
