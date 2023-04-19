# Ordern Admin Web 2

> Ordern Admin Web 2 레파지토리

## Flutter Version
```  

    Flutter 3.3.10 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision 135454af32 (3 months ago) • 2022-12-15 07:36:55 -0800
    Engine • revision 3316dd8728
    Tools • Dart 2.18.6 • DevTools 2.15.0

```     
플러터 버전 확인 `flutter --version`

## How To Run This Project
플러터 설치 필요 `https://docs.flutter.dev/get-started/install`

프로젝트 로컬에서 실행: `flutter run`

## How To Use IDEA for This Project
1. Android studio or Visual Studio Code 설치 필요

## How To Deploy This Project


1. Dependencies 명시 
   `프로젝트 root 에서 pubstepc.yaml 파일에 dependencies: 하위에 필요한 라이브러리를 추가한다. Indentation 주의(탭 하나가 space 2칸)`

2. Dependencies 설치  
   `터미널에서 flutter pub get`

3. flutter 에서 android OS, iOS, web, pc 버전으로 각각 빌드가 가능하지만, 여기서는 web 용으로만 빌드한다.
   `터미널에서 flutter build web --release 혹은 IDE 에서 빌드(Android Studio 기준 Build -> Flutter -> Build Web)`

```
   💪 Building with sound null safety 💪
   ...
   Compiling lib/main.dart for the Web...                             17.7s

```

4. 배포.  
      `생성된 파일을 확인 후 root 에 build/web 폴더에 html 및 js 파일 생성 확인 후 필요한 곳에 배포한다.`


## Reference
### Flutter
https://docs.flutter.dev/

## Android Studio
https://spring.io/projects/spring-cloud-gcp

## Flutter Firebase
https://firebase.google.com/docs/flutter/setup?platform=web

