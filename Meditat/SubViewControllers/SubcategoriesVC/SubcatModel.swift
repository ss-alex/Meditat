//
//  SubcategoryModel.swift
//  Meditat
//
//  Created by Alexey Kirpichnikov on 2021/2/22.
//

import UIKit

struct SubcatModel {
    let subcategoryName: String
}

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
    
    var subcategoryArray: [SubcatModel] {
        switch self {
        case .сон:
            return [SubcatModel(subcategoryName: "Не могу уснуть"),
                    SubcatModel(subcategoryName: "Засыпаю"),
                    SubcatModel(subcategoryName: "Беспокойство")]
        case .пауза:
            return [SubcatModel(subcategoryName: "пауза один"),
                    SubcatModel(subcategoryName: "пауза два"),
                    SubcatModel(subcategoryName: "пауза три")]
        case .на_работе:
            return [SubcatModel(subcategoryName: "на_работе один"),
                    SubcatModel(subcategoryName: "на_работе два"),
                    SubcatModel(subcategoryName: "на_работе три")]
        case .сложный_день:
            return [SubcatModel(subcategoryName: "сложный_день один"),
                    SubcatModel(subcategoryName: "сложный_день два"),
                    SubcatModel(subcategoryName: "сложный_день три")]
        case .на_прогулке:
            return [SubcatModel(subcategoryName: "на_прогулке один"),
                    SubcatModel(subcategoryName: "на_прогулке два"),
                    SubcatModel(subcategoryName: "на_прогулке три")]
        case .sos:
            return [SubcatModel(subcategoryName: "sos один"),
                    SubcatModel(subcategoryName: "sos два"),
                    SubcatModel(subcategoryName: "sos три")]
        case .утро:
            return [SubcatModel(subcategoryName: "утро один"),
                    SubcatModel(subcategoryName: "утро два"),
                    SubcatModel(subcategoryName: "утро три")]
        case .после_работы:
            return [SubcatModel(subcategoryName: "после_работы один"),
                    SubcatModel(subcategoryName: "после_работы два"),
                    SubcatModel(subcategoryName: "после_работы три")]
        case .большое_событие:
            return [SubcatModel(subcategoryName: "большое_событие один"),
                    SubcatModel(subcategoryName: "большое_событие два"),
                    SubcatModel(subcategoryName: "большое_событие три")]
        case .в_дороге:
            return [SubcatModel(subcategoryName: "в_дороге один"),
                    SubcatModel(subcategoryName: "в_дороге два"),
                    SubcatModel(subcategoryName: "в_дороге три")]
        }
    }
}


