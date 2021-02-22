//
//  SubcategoryModel.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/22.
//

import UIKit

enum Subcategory {
    case сон
    case пауза
    case на_работе
    case сложный_день
    case на_прогулке
    case sos
    case утро
    case после_работы
    case большое_событие
    case в_дороге
}

extension Subcategory {
    var title: String {
        switch self {
        case .сон:
            return "Сон"
        case .пауза:
            return "Пауза"
        case .на_работе:
            return "На работе"
        case .сложный_день:
            return "Сложный день"
        case .на_прогулке:
            return "На прогулке"
        case .sos:
            return "SOS"
        case .утро:
            return "Утро"
        case .после_работы:
            return "После работы"
        case .большое_событие:
            return "Большое событие"
        case .в_дороге:
            return "В дороге"
        }
    }
}


