//
//  MainPresenter.swift
//  ADBlock
//
//  Created by Aleksei on 27.10.2023.
//

import UIKit

protocol MainPresenter: AnyObject {
    var propertyCellContent: [PropertyCellModel] { get }
    func injectView(with view: MainViewProtocol)
    
    func viewDidLoad()
    func tuppedCell(_ cell: SelectedCell)
    func tuppedTransitionTitle()
}

enum SelectedCell: Int {
    case first
    case second
    case third
    case notFound
}

final class MainPresenterImpl {
    // MARK: - Private Properties
    
    private weak var view: MainViewProtocol?

    // MARK: - Init
    
    init() {}
    
    // MARK: - Public Methods

    func injectView(with view: MainViewProtocol) {
        if self.view == nil { self.view = view }
    }
}

    // MARK: - MainPresenter

extension MainPresenterImpl: MainPresenter {
    var propertyCellContent: [PropertyCellModel] {
        return PropertyCellModel.getCellModels()
    }
    
    func viewDidLoad() {
        view?.updateContent(title: Localizable.Title.mainModule)
    }
    
    func tuppedCell(_ cell: SelectedCell) {
        switch cell {
        case .first:
            print("tupped first cell")
        case .second:
            print("tupped second cell")
        case .third:
            print("tupped third cell")
        case .notFound:
            break
        }
    }
    
    func tuppedTransitionTitle() {
        print("tupped title")
    }
}
