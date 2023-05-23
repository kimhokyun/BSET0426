//
//  AppDelegate.swift
//  BSET0426
//
//  Created by hokyun Kim on 2023/04/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

/*
 나는 xcode, swift를 사용하여 앱을 만들거야.
 아래 제약사항을 고려해서 앱을 만들어줘.
 1. URLSession을 사용해서 직접 api를 호출해서 tableview에 보여주는 swift 소스코드 작성해주고, api를 호출하는 부분은 Data.swift에 작성해줘
 2. 응답받은 데이터는 JSONSerialization를 사용해서 파싱해주고,
 3. 하나의 별도 Data.swift파일을 작성해서 구조체를 만들어주고, 구조체의 변수명은 응답 데이터와 동일하게 사용해줘.
 4. imageFile은 asset으로 로컬에 저장해둔 파일을 열거야.
 5. 커스텀 셀의 id는 CustomTableViewCell 이야.
 6. 모든 소스코드는 내장 라이브러리를 사용해줘.
 7. UI Protocol은 extension을 사용해 적용하고, delegate, datasource 추가하는거 잊지마.
 
 api : http://localhost:3300/dcx/3/groupMember
 [response]
 {
   "groupMember": [
     {
       "group_id": "10",
       "group_name": "가족",
       "member": [
         {
           "id": "11",
           "name": "아빠",
           "imageFile": "thumb11.jpg"
         },
         {
           "id": "12",
           "name": "엄마",
           "imageFile": "thumb12.jpg"
         },
         {
           "id": "13",
           "name": "엄마 첫째 아들",
           "imageFile": "thumb13.jpg"
         },
         {
           "id": "14",
           "name": "아빠 셋째 딸",
           "imageFile": "thumb14.jpg"
         },
         {
           "id": "15",
           "name": "할머니",
           "imageFile": "thumb15.jpg"
         }
       ]
     },
     {
       "group_id": "20",
       "group_name": "친구",
       "member": [
         {
           "id": "21",
           "name": "지수",
           "imageFile": "thumb21.jpg"
         },
         {
           "id": "22",
           "name": "제니",
           "imageFile": "thumb22.jpg"
         },
         {
           "id": "23",
           "name": "로제",
           "imageFile": "thumb23.jpg"
         },
         {
           "id": "24",
           "name": "리사",
           "imageFile": "thumb24.jpg"
         }
       ]
     },
     {
       "group_id": "30",
       "group_name": "직장동료",
       "member": [
         {
           "id": "31",
           "name": "김남준 팀장님",
           "imageFile": "thumb31.jpg"
         },
         {
           "id": "32",
           "name": "김석진 선임",
           "imageFile": "thumb32.jpg"
         },
         {
           "id": "33",
           "name": "민윤기 선임",
           "imageFile": "thumb33.jpg"
         },
         {
           "id": "34",
           "name": "정호석 사원",
           "imageFile": "thumb34.jpg"
         },
         {
           "id": "35",
           "name": "박지민 사원",
           "imageFile": "thumb35.jpg"
         },
         {
           "id": "36",
           "name": "김태형 사원",
           "imageFile": "thumb36.jpg"
         },
         {
           "id": "37",
           "name": "전정국 사원",
           "imageFile": "thumb37.jpg"
         }
       ]
     }
   ]
 }

 */
