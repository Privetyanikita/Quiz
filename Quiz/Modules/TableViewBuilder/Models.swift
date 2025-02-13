//
//  Models.swift
//  Quiz
//
//  Created by NikitaKorniuk   on 13.02.25.
//

import UIKit

final class TableViewCellModel {
    let identifier: String
    var onFill: ((UITableViewCell) -> Void)?
    var onSelect: (() -> Void)?
    
    init(identifier: String, onFill: ((UITableViewCell) -> Void)? = nil, onSelect: (() -> Void)? = nil) {
        self.identifier = identifier
        self.onFill = onFill
        self.onSelect = onSelect
    }
}

final class TableViewSectionModel {
    var cells: [TableViewCellModel]
    var header: String?
    
    init(cells: [TableViewCellModel], header: String? = nil) {
        self.cells = cells
        self.header = header
    }
}
