//
//  UseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

protocol UseCase {
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}
