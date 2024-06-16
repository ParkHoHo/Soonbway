# Soonbway
> 신창역을 기준으로 들어오고 나가는 전철의 위치를 파악하는 앱.

## Description
서울지하철 1호선(장한선)의 경우 연착이 자주 됩니다. <br>
1~2분 차이로 지각이 결정되기 때문에 연착은 크게 다가올 수 밖에 없습니다. 따라서 <u>현재 지하철의 위치를 보여주는 서비스</u>를 제공하고자 합니다. 

특히 순천향대 학생들에게 필요한 기능들을 추가하고자 합니다.


## 기능
- 신창역에서 출발하는 전철의 도착유무 확인 가능
- 신창역에 도착하는 전철의 현재 위치 확인 가능
- 지도에서 현재 위치 파악(업데이트 예정)
- 프로필 관리(업데이트 예정)
- 통학버스 예약
- 도착까지 남은 시간 보여주기(업데이트 예정)

## Environment
### System
- iOS 17.5
- Xcode 15.4(Swift 5.10+)

### Swift Package
- [Alamofire](https://github.com/Alamofire/Alamofire.git)

## Commit Convention Example
```
✨ feat(login): add biometric authentication

🐛 fix(map): resolve crash on location update

📝 docs(readme): update installation instructions

🎨 style(buttons): correct spacing and alignment

♻️ refactor(viewmodel): simplify data binding logic

✅ test(api): add tests for error handling

🔧 chore(deps): update dependency versions
```

## UI 
<img src="/images/도착.png" width=250> | <img src="/images/출발.png" width=250>

<img src="/images/bus.png" width=250>
