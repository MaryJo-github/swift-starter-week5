//
//  auditionManager.swift
//  CodeStarterCamp_Week5
//
//  Created by MARY on 2023/03/20.
//

import Foundation

extension TalentedPerson {
    var hasOutstandingTalent: Bool {
        get {
            self.singing == Level.A || self.dancing == Level.A || self.acting == Level.A
        }
    }
}

struct AuditionManager {
    let totalApplicantsList: [Person]
    var passedApplicantsList: [Person] = []
    
    mutating func cast() {
        guard !totalApplicantsList.isEmpty else { print("지원자가 없습니다."); return }

        for applicant in totalApplicantsList {
            if let person = applicant as? BadPersonality {
                guard person.frequancyOfCursing != Level.A else { continue }
            }
            if let person = applicant as? TalentedPerson {
                guard person.hasOutstandingTalent else { continue }
                passedApplicantsList.append(applicant)
            }
        }
    }
                
    func announcePassedApplicants() {
        guard !passedApplicantsList.isEmpty else { print("합격자가 없습니다."); return }
        print("---합격자 명단---")
        print(passedApplicantsList.map{ $0.name }.joined(separator: "\n"))
        print("--------------\n축하합니다!!")
    }
}
